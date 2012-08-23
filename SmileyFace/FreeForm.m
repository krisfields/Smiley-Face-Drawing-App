//
//  FreeForm.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/22/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "FreeForm.h"

@implementation FreeForm

- (void)drawShape:(CGContextRef)context {
    
    CGContextMoveToPoint(context, self.begin.x, self.begin.y);
    CGContextAddLineToPoint(context, self.end.x, self.end.y);
    
    [[UIColor blueColor] set];
    CGContextStrokePath(context);
}

-(void)beginTouches:(NSSet*)points {
    UITouch *touch = [points anyObject];
    self.begin = [touch locationInView:self.currentView];
    self.end = [touch locationInView:self.currentView];
    
}

-(void)movedTouchPoint:(NSSet*)points {
    UITouch *touch = [points anyObject];
    self.end = [touch locationInView:self.currentView];
}


@end
