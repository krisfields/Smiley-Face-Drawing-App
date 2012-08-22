//
//  TouchDrawView.h
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

@interface TouchDrawView : UIView

@property id<ShapesProtocol> currentShape;
@property NSString* currentShapeType;
@property NSMutableArray *completeShapes;

-(void)clearAll;
-(void)endTouches:(NSSet*)touches;

@end
