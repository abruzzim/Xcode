//
//  ViewController.m
//  codeschool
//
//  Created by abruzzim on 12/24/14.
//  Copyright (c) 2014 Mario Abruzzi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController // The "Paint Brush"

- (void)loadView // Called the first time the view property is accessed.
{
    CGRect viewRect = [[UIScreen mainScreen] bounds];
    UIView *view = [[UIView alloc] initWithFrame:viewRect]; // The "Paint"
    self.view = view;                                       // The "Paint"
}

- (void)viewDidLoad // After loadView; Typically where labels/buttons go.
{
    [super viewDidLoad];
    // Set the view's background color.
    self.view.backgroundColor = [UIColor colorWithRed:0.462 green:0.999 blue:0.999 alpha:1.0];
    
    // Create, place and size a label
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 200, 44)];
    // Declare the label background.
    lbl.backgroundColor = [UIColor whiteColor];
    // Declare the label text.
    lbl.text = @"Test Label";
    // Add the label as a subview.
    [self.view addSubview:lbl];
    
    // Create a button.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect]; // The "Paint"
    // Place and size the button on the screen.
    btn.frame = CGRectMake(100, 100, 90, 44);
    // Set the button's background color.
    btn.backgroundColor = [UIColor yellowColor];
    // Set the button's normal title.
    [btn setTitle:@"Test Button" forState:UIControlStateNormal];
    // Add the button as a subview.
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Started touching the screen");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Ended touching the screen");
}

@end
