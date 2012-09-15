//
//  Triangle.h
//  SmileyFace
//
//  Created by Kris Fields on 8/22/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShapesProtocol.h"

@interface Triangle : NSObject <ShapesProtocol>

@property (nonatomic) CGPoint point1;
@property (nonatomic) CGPoint point2;
@property (nonatomic) CGPoint point3;

-(void)drawShape:(CGContextRef)context;
-(void)beginTouches:(NSSet*)points;
-(void)movedTouchPoint:(NSSet*)points;

@property (weak, nonatomic) UIView *currentView;

@end
