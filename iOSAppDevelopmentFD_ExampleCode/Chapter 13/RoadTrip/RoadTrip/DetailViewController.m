//
//  DetailViewController.m
//  RoadTrip
//
//  Created by Jesse Feiler on 11/27/13.
//  Copyright (c) 2013 Jesse Feiler. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if (self.popOverButton) {
        if ([[self.splitViewController.viewControllers
              lastObject]
             isKindOfClass:[UINavigationController class]]) {
            [self.navigationItem setLeftBarButtonItem:self.popOverButton
                                             animated:YES];
        }
        else {
            NSMutableArray *itemsArray =
            [self.toolbar.items mutableCopy];
            [itemsArray
             insertObject:self.popOverButton atIndex:0];
            [self.toolbar setItems:itemsArray animated:NO];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title =
    NSLocalizedString(@"Road Trip", @"Road Trip");
    if ([[self.splitViewController.viewControllers lastObject] isKindOfClass:[UINavigationController class]])
        [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];else {
            NSMutableArray *itemsArray =
            [self.toolbar.items mutableCopy];
            [itemsArray insertObject:barButtonItem atIndex:0];
            [self.toolbar setItems:itemsArray animated:YES];
        }
    self.masterPopoverController = popoverController;
    self.popOverButton = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    if
        ([[self.splitViewController.viewControllers lastObject]
          isKindOfClass:[UINavigationController class]])
        [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    else {
        NSMutableArray *itemsArray =
        [self.toolbar.items mutableCopy];
        [itemsArray removeObject:barButtonItem];
        [self.toolbar setItems:itemsArray animated:YES];
    }
    self.popOverButton = nil;
    self.masterPopoverController = nil;
}

@end
