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
    UIView *view = [[UIView alloc] initWithFrame:viewRect]; // The "Paint";
                                                            // Object attached to the window that draws its contents upon window's request
    self.view = view;                                       // The "Paint"
}

- (void)viewDidLoad // After loadView; Typically where labels/buttons go.
{
    [super viewDidLoad];
    
    // Set the view's initial background color.
    self.view.backgroundColor = [UIColor colorWithRed:0.462 green:0.999 blue:0.999 alpha:1.0];
    
    // Declare, place and size a label
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake((375/2)-(200/2), 30, 200, 44)]; // The "Paint"
    // Declare the label background.
    lbl.backgroundColor = [UIColor redColor];
    // Declare the label text.
    lbl.text = @"Code School Test Label";
    // Add the label as a subview.
    [self.view addSubview:lbl];
    
    // 50% Transparency Button
    // Declare a rounded rectangle button.
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem]; // The "Paint": Control view object.
    // Set the button's corner radius.
    btn2.layer.cornerRadius = 5;
    // Place and size the button on the screen.
    btn2.frame = CGRectMake((375/2)-(170/2), 150, 170, 44);
    // Set the button's background color.
    btn2.backgroundColor = [UIColor greenColor];
    // Set the button's normal title.
    [btn2 setTitle:@"Bg Transparency 50%" forState:UIControlStateNormal];
    // Set the button's touched title
    [btn2 setTitle:@"Btn2 Touched" forState:UIControlStateHighlighted];
    // Add a control event
    //   that sends a message to the ViewController,
    //   to call the "chgBgTransparency" method,
    //   when the button is touched then released.
    [btn2 addTarget:self action:@selector(chgBgTransparency:) forControlEvents:UIControlEventTouchUpInside];
    // Add the button as a subview.
    [self.view addSubview:btn2];
    
    // 100% Transparency Button
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.backgroundColor = [UIColor orangeColor];
    btn3.frame = CGRectMake((375/2)-(170/2), 200, 170, 44);
    btn3.layer.cornerRadius = 5;
    [btn3 setTitle:@"Bg Transparency 100%" forState:UIControlStateNormal];
    [btn3 setTitle:@"Btn3 Touched" forState:UIControlStateHighlighted];
    [btn3 addTarget:self action:@selector(chgBgTransparency:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
    
    // Purple Background Button
    // Declare a rounded rectangle button.
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem]; // The "Paint"; Control view object.
    // Set the button's corner radius.
    btn1.layer.cornerRadius = 5;
    // Place and size the button on the screen.
    btn1.frame = CGRectMake((375/2)-(140/2), 250, 140, 44);
    // Set the button's background color.
    btn1.backgroundColor = [UIColor yellowColor];
    // Set the button's normal title.
    [btn1 setTitle:@"Make Purple" forState:UIControlStateNormal];
    // Set the button's touched title
    [btn1 setTitle:@"Btn1 Touched" forState:UIControlStateHighlighted];
    // Add control event.
    [btn1 addTarget:self action:@selector(setBgColorPurple:) forControlEvents:UIControlEventTouchUpInside];
    // Add the button as a subview.
    [self.view addSubview:btn1];
    
    // Green Background Button
    UIButton *greenBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    greenBtn.layer.cornerRadius = 10;
    greenBtn.frame = CGRectMake((375/2)-(100/2), 300, 100, 44);
    greenBtn.backgroundColor = [UIColor magentaColor];
    [greenBtn setTitle:@"Make Green" forState:UIControlStateNormal];
    [greenBtn addTarget:self action:@selector(setViewBgColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:greenBtn];
    
    // Blue Background Button
    UIButton *blueBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    blueBtn.layer.cornerRadius = 10;
    blueBtn.frame = CGRectMake((375/2)-(100/2), 350, 100, 44);
    blueBtn.backgroundColor = [UIColor grayColor];
    [blueBtn setTitle:@"Make Blue" forState:UIControlStateNormal];
    [blueBtn addTarget:self action:@selector(setViewBgColor:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blueBtn];
}

// Instance method that returns nothing
// called "chgBgTransparency"
// that takes an id (pointer to an instance) of a UIButton class instance
// called "sender".
- (void)chgBgTransparency:(UIButton *)sender
{
    // Log the event to the console.
    NSLog(@"chgBgTransparency event; Sending object is: %@", sender);
    
    // Examine the sender's (button's) properties
    // to determine the correct action to take.
    if ([sender.titleLabel.text isEqualToString:@"Btn2 Touched"]) {
        // Set the root view's background transparency to 1/2.
        self.view.alpha = 0.5;
    } else {
        // Set the root view's background transparency to 1.
        self.view.alpha = 1.0;
    }
    
    // Remove the sender (the button) from the view.
    [sender removeFromSuperview];
}

// Instance method that returns nothing
// called "chgViewBgColor"
// that takes a pointer to an instance of a UIButton class
// called "sender".

- (void)setViewBgColor:(UIButton *)sender
{
    // Log the event to the console.
    NSLog(@"chgViewBgColor event; Sending object is: %@", sender);
    
    // Examine the sender's (button's) properties
    // to determine the correct action to take.
    if ([sender.titleLabel.text isEqualToString:@"Make Green"]) {
        self.view.backgroundColor = [UIColor greenColor];
    } else {
        self.view.backgroundColor = [UIColor blueColor];
    }
}

- (void)setBgColorPurple:(id)sender
{
    // Log event to the console.
    NSLog(@"setBgColorPurple event; sender is: %@", sender);
    // Set the root view's background color to purple.
    self.view.backgroundColor = [UIColor purpleColor];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Began screen touch");
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Ended screen touch");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
