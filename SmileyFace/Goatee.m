//
//  Goatee.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "Goatee.h"

@implementation Goatee

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context,
            self.bounds.origin.x,
            self.bounds.origin.y);
    CGContextAddLineToPoint(context,
            self.bounds.origin.x + (self.bounds.size.width),
            self.bounds.origin.y);
    CGContextAddLineToPoint(context,
            self.bounds.origin.x + (self.bounds.size.width)/2,
            self.bounds.origin.y + (self.bounds.size.height));
    
    [[UIColor blackColor] set];
    CGContextFillPath(context);
    
}

@end
