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
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithRed:0.462 green:0.749 blue:0.937 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Started touching the screen");
}

@end
