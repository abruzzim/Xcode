//
//  AppDelegate.h
//  codeschool
//
//  Created by abruzzim on 12/24/14.
//  Copyright (c) 2014 Mario Abruzzi. All rights reserved.
//

#import <UIKit/UIKit.h>

// View Controller forward declaration. The "Paint Brush".
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// ViewController forward declaration. The "Paint Brush".
@property (strong, nonatomic) ViewController *viewController;

@end

