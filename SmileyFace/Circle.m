//
//  Circle.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/22/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "Circle.h"

@implementation Circle

@synthesize begin, end;

- (void)drawShape:(CGContextRef)context {

    //make the circle (using an arc)
    float diameter = sqrt(((end.x-begin.x)*(end.x-begin.x)) + ((end.y-begin.y)*(end.y-begin.y)));
    CGContextAddArc(context, (begin.x+end.x)/2, (begin.y+end.y)/2, diameter/2, 0, M_PI * 2, NO);
    
    [[UIColor redColor] set];
    CGContextStrokePath(context);
}

-(void)beginTouches:(NSSet*)points {
    NSEnumerator *enumerator = [points objectEnumerator];
    self.begin = [enumerator.nextObject locationInView:self.currentView];
    self.end = [enumerator.nextObject locationInView:self.currentView];

}

-(void)movedTouchPoint:(NSSet*)points {
    NSEnumerator *enumerator = [points objectEnumerator];
    self.begin = [enumerator.nextObject locationInView:self.currentView];
    self.end = [enumerator.nextObject locationInView:self.currentView];
}

@end
