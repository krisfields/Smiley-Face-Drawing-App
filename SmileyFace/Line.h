//
//  Line.h
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShapesProtocol.h"

@interface Line : NSObject <ShapesProtocol>

@property (nonatomic) CGPoint begin;
@property (nonatomic) CGPoint end;

-(void)drawShape:(CGContextRef)context;
-(void)beginTouches:(NSSet*)points;
-(void)movedTouchPoint:(NSSet*)points;

@property (strong, nonatomic) UIView *currentView;

@end