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
    self.headerLbl = [[UILabel alloc] initWithFrame:CGRectMake((375/2)-(200/2), 30, 200, 44)]; // The "Paint"
    // Declare the label background.
    self.headerLbl.backgroundColor = [UIColor redColor];
    // Declare the label text.
    self.headerLbl.text = @"Code School Test Label";
    // Add the label as a subview.
    [self.view addSubview:self.headerLbl];
    
    // 50% Transparency Button
    // Declare a rounded rectangle button.
    self.fiftyPctBtn = [UIButton buttonWithType:UIButtonTypeSystem]; // The "Paint": Control view object.
    // Set the button's corner radius.
    self.fiftyPctBtn.layer.cornerRadius = 5;
    // Place and size the button on the screen.
    self.fiftyPctBtn.frame = CGRectMake((375/2)-(170/2), 150, 170, 44);
    // Set the button's background color.
    self.fiftyPctBtn.backgroundColor = [UIColor greenColor];
    // Set the button's normal title.
    [self.fiftyPctBtn setTitle:@"Bg Transparency 50%" forState:UIControlStateNormal];
    // Set the button's touched title
    [self.fiftyPctBtn setTitle:@"fiftyPctBtn Touched" forState:UIControlStateHighlighted];
    // Add a control event
    //   that sends a message to the ViewController,
    //   to call the "chgBgTransparency" method,
    //   when the button is touched then released.
    [self.fiftyPctBtn addTarget:self
                         action:@selector(setBgTransparency:)
               forControlEvents:UIControlEventTouchUpInside];
    // Add the button as a subview.
    [self.view addSubview:self.fiftyPctBtn];
    
    // 100% Transparency Button
    self.hundredPctBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.hundredPctBtn.backgroundColor = [UIColor orangeColor];
    self.hundredPctBtn.frame = CGRectMake((375/2)-(170/2), 200, 170, 44);
    self.hundredPctBtn.layer.cornerRadius = 5;
    [self.hundredPctBtn setTitle:@"Bg Transparency 100%" forState:UIControlStateNormal];
    [self.hundredPctBtn setTitle:@"hundredBtn Touched" forState:UIControlStateHighlighted];
    [self.hundredPctBtn addTarget:self
                           action:@selector(setBgTransparency:)
                 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.hundredPctBtn];
    
    // Purple Background Button
    // Declare a rounded rectangle button.
    self.purpleBtn = [UIButton buttonWithType:UIButtonTypeSystem]; // The "Paint"; Control view object.
    // Set the button's corner radius.
    self.purpleBtn.layer.cornerRadius = 5;
    // Place and size the button on the screen.
    self.purpleBtn.frame = CGRectMake((375/2)-(140/2), 250, 140, 44);
    // Set the button's background color.
    self.purpleBtn.backgroundColor = [UIColor yellowColor];
    // Set the button's normal title.
    [self.purpleBtn setTitle:@"Make Purple" forState:UIControlStateNormal];
    // Set the button's touched title
    [self.purpleBtn setTitle:@"Btn1 Touched" forState:UIControlStateHighlighted];
    // Add control event.
    [self.purpleBtn addTarget:self
                       action:@selector(setBgColorPurple:)
             forControlEvents:UIControlEventTouchUpInside];
    // Add the button as a subview.
    [self.view addSubview:self.purpleBtn];
    
    // Green Background Button
    self.greenBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.greenBtn.layer.cornerRadius = 10;
    self.greenBtn.frame = CGRectMake((375/2)-(100/2), 300, 100, 44);
    self.greenBtn.backgroundColor = [UIColor magentaColor];
    [self.greenBtn setTitle:@"Make Green" forState:UIControlStateNormal];
    [self.greenBtn addTarget:self
                      action:@selector(setViewBgColor:)
            forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.greenBtn];
    
    // Blue Background Button
    self.blueBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.blueBtn.layer.cornerRadius = 10;
    self.blueBtn.frame = CGRectMake((375/2)-(100/2), 350, 100, 44);
    self.blueBtn.backgroundColor = [UIColor grayColor];
    [self.blueBtn setTitle:@"Make Blue" forState:UIControlStateNormal];
    [self.blueBtn addTarget:self
                     action:@selector(setViewBgColor:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.blueBtn];
}

// Instance method that returns nothing
// called "chgBgTransparency"
// that takes an id (pointer to an instance) of a UIButton class instance
// called "sender".
- (void)setBgTransparency:(UIButton *)sender
{
    // Log the event to the console.
    NSLog(@"chgBgTransparency event; Sending object is: %@", sender);
    
    // Examine the sender (the object)
    // to determine the correct action to take.
    if ([sender isEqual:self.fiftyPctBtn]) {
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
    if ([sender isEqual:self.greenBtn]) {
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
