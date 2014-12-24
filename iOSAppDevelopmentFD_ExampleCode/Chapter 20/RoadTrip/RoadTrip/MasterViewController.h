//
//  MasterViewController.h
//  RoadTrip
//
//  Created by Jesse Feiler on 11/27/13.
//  Copyright (c) 2013 Jesse Feiler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DestinationController.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController <UITextFieldDelegate, DestinationControllerDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;

- (void)destinationController:(DestinationController *) controller didFinishWithSave:(BOOL)save;

@end
