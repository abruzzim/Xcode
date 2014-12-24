//
//  DetailViewController.h
//  RoadTrip
//
//  Created by Jesse Feiler on 11/27/13.
//  Copyright (c) 2013 Jesse Feiler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) UIBarButtonItem * popOverButton;
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@property (weak, nonatomic) IBOutlet UIWebView *weatherView;
@end
