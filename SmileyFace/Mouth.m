//
//  Mouth.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "Mouth.h"

@interface Mouth ()
@property CGFloat p1x, p1y, p2x, p2y;
@property BOOL firstTime;
@end

@implementation Mouth

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    }
    self.firstTime = YES;

    return self;
}
-(UIResponder *)nextResponder
{
    return nil;
}
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    //NSLog(@"%@", self.firstTime?@"firstime":@"notfirsttime");
    if (self.firstTime == YES) {
        self.p1x = center.x*.5;
        self.p1y = self.bounds.origin.y + self.bounds.size.height;
        self.p2x = center.x*1.5;
        self.p2y = self.bounds.origin.y + self.bounds.size.height;
        self.firstTime = NO;
    }
    
    //make the arc (using add curve to point)
    CGContextMoveToPoint(ctx, self.bounds.origin.x, center.y);
    CGContextAddCurveToPoint(ctx,
        self.p1x,
        self.p1y,
        self.p2x,
        self.p2y,
        self.bounds.origin.x + self.bounds.size.width,
        center.y);
    //NSLog(@"%f %f %f %f", self.p1x, self.p1y, self.p2x, self.p2y);
    
//    make the arc (using an arc)
//    float maxRadius = hypot(bounds.size.width, bounds.size.height) /4.0;
//    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0, M_PI * 1, NO);
    
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    CGContextStrokePath(ctx);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *t in touches) {
        CGPoint loc = [t locationInView:self];
        self.p1x = loc.x - 10;
        self.p1y = loc.y - 10;
        self.p2x = loc.x + 10;
        self.p2y = loc.y + 10;
    }
    [self setNeedsDisplay];
    //NSLog(@"you called touches moved");
}

@end
