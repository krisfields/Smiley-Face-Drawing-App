//
//  ViewController.h
//  SmileyFace
//
//  Created by Diana Zmuda on 8/21/12.
//  Copyright (c) 2012 Diana Zmuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

- (IBAction)linesButton:(UIBarButtonItem *)sender;
- (IBAction)circleButton:(UIBarButtonItem *)sender;
- (IBAction)freeFormButton:(UIBarButtonItem *)sender;
- (IBAction)goateeToggle:(UIBarButtonItem *)sender;

@end
