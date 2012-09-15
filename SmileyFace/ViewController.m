//
//  ViewController.m
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import "ViewController.h"
#import "Smiley.h"
#import "Mouth.h"
#import "Goatee.h"
#import "TouchDrawView.h"

@interface ViewController ()
@property BOOL hasGoatee;
@property Goatee* goateeView;
@property TouchDrawView* drawView;
@end

@implementation ViewController
@synthesize toolBar = _toolBar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.hasGoatee = NO;
    
    CGRect faceFrame = CGRectMake(0, 0, 320, 415);
    Smiley *faceView = [[Smiley alloc] initWithFrame:faceFrame];
    faceView.color = [UIColor yellowColor];
    [self.view addSubview:faceView];
    
    CGRect eye1Frame = CGRectMake(70, 90, 60, 60);
    Smiley *eye1View = [[Smiley alloc] initWithFrame:eye1Frame];
    eye1View.color = [UIColor greenColor];
    [faceView addSubview:eye1View];
    
    CGRect eye2Frame = CGRectMake(160, 90, 80, 80);
    Smiley *eye2View = [[Smiley alloc] initWithFrame:eye2Frame];
    eye2View.color = [UIColor blueColor];
    [faceView addSubview:eye2View];
    
    CGRect goateeFrame = CGRectMake(140, 250, 30, 50);
    self.goateeView = [[Goatee alloc] initWithFrame:goateeFrame];
    [faceView addSubview:self.goateeView];
    self.goateeView.hidden = YES;
    
    CGRect drawFrame = CGRectMake(0, 0, 320, 415);
    self.drawView = [[TouchDrawView alloc] initWithFrame:drawFrame];
    //this will overlay everything, including the button!!!
    [faceView addSubview:self.drawView];
    
    CGRect mouthFrame = CGRectMake(80, 100, 150, 150);
    Mouth *mouthView = [[Mouth alloc] initWithFrame:mouthFrame];
    [faceView addSubview:mouthView];
}

- (void)viewDidUnload
{
    [self setToolBar:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction)linesButton:(UIBarButtonItem *)sender {
    self.drawView.currentShapeType = @"line";

}

- (IBAction)circleButton:(UIBarButtonItem *)sender {
    self.drawView.currentShapeType = @"circle";
}

- (IBAction)freeFormButton:(UIBarButtonItem *)sender {
    self.drawView.currentShapeType = @"freeform";
}

- (IBAction)goateeToggle:(UIBarButtonItem *)sender {
    if (self.goateeView.hidden) {
        self.goateeView.hidden = NO;
    } else {
        self.goateeView.hidden = YES;
    }
}

- (IBAction)TriangleButton:(id)sender {
    self.drawView.currentShapeType = @"triangle";
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"called");
    if (event.type == UIEventSubtypeMotionShake )
    {
        NSLog(@"1");
        [self.drawView clearAll];
    }
}

//this stuff is so the shake gesture will work
-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    //you must make the view first responder
    [self becomeFirstResponder];
    NSLog(@"called viewdidappaearrerere");
}

@end
