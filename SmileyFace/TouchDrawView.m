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
#import "Triangle.h"

@implementation TouchDrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.completeShapes = [[NSMutableArray alloc] init];
        self.currentShapeType = @"line";
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
    
    //draw current shape
    if (self.currentShape) {
        [self.currentShape drawShape:context];
    }
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
    if ([self.currentShapeType isEqualToString:@"freeform"]) {
        self.currentShape = [Line new];
    }
    if ([self.currentShapeType isEqualToString:@"triangle"]) {
        self.currentShape = [Triangle new];
    }
    self.currentShape.currentView = self;
    [self.currentShape beginTouches:touches];
    [self setNeedsDisplay];
    
}

-(void)touchesMoved:(NSSet*)touches withEvent:(UIEvent *)event
{
    [self.currentShape movedTouchPoint:touches];
    if ([self.currentShapeType isEqualToString:@"freeform"]) {
        [self.completeShapes addObject:self.currentShape];
        self.currentShape = [Line new];
        self.currentShape.currentView = self;
        [self.currentShape beginTouches:touches];
    }
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

-(void)clearAll
{
    //delete everything
    [self.completeShapes removeAllObjects];
    self.currentShape = nil;
    //reinitialize
    [self setNeedsDisplay];
}

@end
