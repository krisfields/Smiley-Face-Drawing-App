//
//  Smiley.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "Smiley.h"

@implementation Smiley

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    //set the center and the radius of the circle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    float maxRadius = hypot(bounds.size.width, bounds.size.height) /4.0;
    
    //make the circle (using an arc)
    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0, M_PI * 2, NO);
    
    //how do we set the background of this one view?
    [self.color set];
    CGContextFillPath(ctx);
    NSLog(@"%f", bounds.origin.x);
    NSLog(@"%f", bounds.origin.y);
    NSLog(@"%@", self.color);
}


@end
