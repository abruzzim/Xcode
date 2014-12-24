//
//  DestinationController.h
//  RoadTrip
//
//  Created by Wiley Publishing on 2/9/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DestinationControllerDelegate;

@interface DestinationController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *destinationTableView;
@property (strong, nonatomic) id <DestinationControllerDelegate> delegate;
@property (nonatomic, readonly) NSUInteger selectedDestination;

- (IBAction)cancel:(id)sender;

@end

@protocol DestinationControllerDelegate
@required
- (void)destinationController: (DestinationController *)controller
            didFinishWithSave: (BOOL)save;
@end
