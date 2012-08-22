//
//  Line.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "Line.h"

@implementation Line

 @synthesize begin, end;

- (void)drawShape:(CGContextRef)context {
    //setting up the contex
    [[UIColor blackColor] set];
    
    CGContextMoveToPoint(context, self.begin.x, self.begin.y);
    CGContextAddLineToPoint(context, self.end.x, self.end.y);
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
