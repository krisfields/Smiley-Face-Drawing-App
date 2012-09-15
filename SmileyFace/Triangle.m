//
//  Triangle.m
//  SmileyFace
//
//  Created by Kris Fields on 8/22/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle

@synthesize point1, point2, point3;

- (void)drawShape:(CGContextRef)context {
    
    CGContextMoveToPoint(context, self.point1.x, self.point1.y);
    CGContextAddLineToPoint(context, self.point2.x, self.point2.y);
    CGContextAddLineToPoint(context, self.point3.x, self.point3.y);
    CGContextAddLineToPoint(context, self.point1.x, self.point1.y);
    
    [[UIColor orangeColor] set];
    CGContextStrokePath(context);
}

-(void)beginTouches:(NSSet*)points {
    NSEnumerator *enumerator = [points objectEnumerator];
    self.point1 = [enumerator.nextObject locationInView:self.currentView];
    self.point2 = [enumerator.nextObject locationInView:self.currentView];
    self.point3 = [enumerator.nextObject locationInView:self.currentView];
    if ([points count] < 3){
        self.point2 = self.point1;
        self.point3 = self.point1;
    }
    
}

-(void)movedTouchPoint:(NSSet*)points {
    if ([points count] > 2) {
        NSEnumerator *enumerator = [points objectEnumerator];
        CGPoint trianglePoint1 = [enumerator.nextObject locationInView:self.currentView];
        CGPoint trianglePoint2 = [enumerator.nextObject locationInView:self.currentView];
        CGPoint trianglePoint3 = [enumerator.nextObject locationInView:self.currentView];
        self.point1 = trianglePoint1;
        self.point2 = trianglePoint2;
        self.point3 = trianglePoint3;
    }
    

}


@end
