//
//  TouchDrawView.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "TouchDrawView.h"
#import "Line.h"
#import "Circle.h"
#import "ShapesProtocol.h"

@implementation TouchDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.completeShapes = [[NSMutableArray alloc] init];
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        [self setMultipleTouchEnabled:YES];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    //draw all the lines in the completed lines
    for (id<ShapesProtocol> shape in self.completeShapes) {
        [shape drawShape:context];
    }
    
    //draw current line
    if (self.currentShape) {
        [self.currentShape drawShape:context];
    }
}

-(void)clearAll
{
    [self.completeShapes removeAllObjects];
    [self setNeedsDisplay];
}

-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event
{
    //[super touchesBegan:touches withEvent:event];
    if ([self.currentShapeType isEqualToString: @"line"]) {
        Line *newLine = [[Line alloc] init];
        self.currentShape = newLine;
    }
    if ([self.currentShapeType isEqualToString:@"circle"]) {
        self.currentShape = [Circle new];
    }
    self.currentShape.currentView = self;
    [self.currentShape beginTouches:touches];
    [self setNeedsDisplay];
        
//        CGPoint loc = [t locationInView:self];
//        Line *newLine = [[Line alloc] init];
//        
//        //set the start point and end point as the same place here (change end in touches moved)
//        [newLine setBegin:loc];
//        [newLine setEnd:loc];
//        self.currentShape = newLine;
    
}

-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event
{
    [self.currentShape movedTouchPoint:touches];
    [self setNeedsDisplay];
}

-(void)endTouches:(NSSet*)touches
{
    [self.currentShape movedTouchPoint:touches];
    [self.completeShapes addObject:self.currentShape];
    [self setNeedsDisplay];
}

//overwrite the built in methods to call the new endTouches method
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self endTouches:touches];
}

@end
