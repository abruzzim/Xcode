//
//  ViewController.h
//  codeschool
//
//  Created by abruzzim on 12/24/14.
//  Copyright (c) 2014 Mario Abruzzi. All rights reserved.
//

#import <UIKit/UIKit.h>

// The "Paint Brush".
@interface ViewController : UIViewController

// Declare variable names for the subviews.
@property (strong, nonatomic) UILabel *headerLbl;
@property (weak, nonatomic) UIButton *fiftyPctBtn;
@property (weak, nonatomic) UIButton *hundredPctBtn;
@property (weak, nonatomic) UIButton *purpleBtn;
@property (weak, nonatomic) UIButton *greenBtn;
@property (weak, nonatomic) UIButton *blueBtn;

- (void)setViewBgColor:(id)sender;
- (void)setBgTransparency:(id)sender;
- (void)setBgColorPurple:(id)sender;

@end

