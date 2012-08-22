//
//  Circle.h
//  SmileyFace
//
//  Created by Diana Zmuda on 8/22/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShapesProtocol.h"

@interface Circle : NSObject <ShapesProtocol>
@property (nonatomic) CGPoint diameterStart;
@property (nonatomic) CGPoint diameterEnd;
@property (strong, nonatomic) UIView *currentView;
@end
