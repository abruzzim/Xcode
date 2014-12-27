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
    // Set the view's background color.
    self.view.backgroundColor = [UIColor colorWithRed:0.462 green:0.999 blue:0.999 alpha:1.0];
    
    // Declare, place and size a label
    UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake((375/2)-(200/2), 30, 200, 44)]; // The "Paint"
    // Declare the label background.
    lbl.backgroundColor = [UIColor redColor];
    // Declare the label text.
    lbl.text = @"Code School Test Label";
    // Add the label as a subview.
    [self.view addSubview:lbl];
    
    // Declare a rounded rectangle button.
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeSystem]; // The "Paint"; Control view object.
    // Set the button's corner radius.
    btn1.layer.cornerRadius = 5;
    // Place and size the button on the screen.
    btn1.frame = CGRectMake((375/2)-(140/2), 150, 140, 44);
    // Set the button's background color.
    btn1.backgroundColor = [UIColor yellowColor];
    // Set the button's normal title.
    [btn1 setTitle:@"Set Purple Bg" forState:UIControlStateNormal];
    // Set the button's touched title
    [btn1 setTitle:@"Btn1 Touched" forState:UIControlStateHighlighted];
    // Add control event.
    [btn1 addTarget:self action:@selector(setBgColorPurple:) forControlEvents:UIControlEventTouchUpInside];
    // Add the button as a subview.
    [self.view addSubview:btn1];
    
    // Declare a rounded rectangle button.
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeSystem]; // The "Paint": Control view object.
    // Set the button's corner radius.
    btn2.layer.cornerRadius = 5;
    // Place and size the button on the screen.
    btn2.frame = CGRectMake((375/2)-(170/2), 200, 170, 44);
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
    [btn2 addTarget:self action:@selector(chgBgTransparencyHalf:) forControlEvents:UIControlEventTouchUpInside];
    // Add the button as a subview.
    [self.view addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn3.backgroundColor = [UIColor orangeColor];
    btn3.frame = CGRectMake((375/2)-(170/2), 250, 170, 44);
    btn3.layer.cornerRadius = 5;
    [btn3 setTitle:@"Bg Transparency 100%" forState:UIControlStateNormal];
    [btn3 setTitle:@"Btn3 Touched" forState:UIControlStateHighlighted];
    [btn3 addTarget:self action:@selector(chgBgTransparencyFull:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn3];
}

// Instance method that returns nothing
// called "chgBgTransparencyHalf"
// that takes an id (pointer to an instance) of a UIButton class instance
// called "sender".
- (void)chgBgTransparencyHalf:(id)sender
{
    // Log event to the console.
    NSLog(@"chgBgTransparencyHalf event; sender is: %@", sender);
    // Set root view's background transparency to 1/2.
    self.view.alpha = 0.5;
    // Remove the sender (the button) from the view.
    [sender removeFromSuperview];
}

- (void)chgBgTransparencyFull:(id)sender
{
    // Log event to the console.
    NSLog(@"chgBgTransparencyFull event; sender is: %@", sender);
    // Set root view's background transparency to 1.
    self.view.alpha = 1.0;
    // Remove the sender (the button) from the view.
    [sender removeFromSuperview];
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
