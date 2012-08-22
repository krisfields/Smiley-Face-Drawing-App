//
//  ShapesProtocol.h
//  SmileyFace
//
//  Created by Diana Zmuda on 8/22/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ShapesProtocol <NSObject>

@property (strong, nonatomic) UIView *currentView;

-(void)drawShape:(CGContextRef)context;

-(void)beginTouches:(NSSet*)points;

-(void)movedTouchPoint:(NSSet*)points;

@end
