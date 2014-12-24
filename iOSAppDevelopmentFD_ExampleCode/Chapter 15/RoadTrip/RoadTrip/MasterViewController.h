//
//  MasterViewController.h
//  RoadTrip
//
//  Created by Jesse Feiler on 11/27/13.
//  Copyright (c) 2013 Jesse Feiler. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
