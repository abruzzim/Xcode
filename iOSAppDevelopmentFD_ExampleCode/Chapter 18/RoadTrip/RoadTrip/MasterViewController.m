//
//  MasterViewController.m
//  RoadTrip
//
//  Created by Jesse Feiler on 11/27/13.
//  Copyright (c) 2013 Jesse Feiler. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "AppDelegate.h"
#import "Trip.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    AppDelegate* appDelegate = [[UIApplication
                                 sharedApplication] delegate];
    self.title = appDelegate.trip.destinationName;
    UIImageView* imageView = [[UIImageView alloc]
                              initWithImage:[appDelegate.trip destinationImage]];
    self.tableView.backgroundView = imageView;

    NSLog (@" %@", self.tableView);
    
    //self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    UISwipeGestureRecognizer *swipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSwipeGesture:)];
    swipeGesture.direction =
    UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGesture];
}

- (void)prepareForSegue:
(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==
        UIUserInterfaceIdiomPad) {
        DetailViewController *currentDetailViewController;
        if ([[self.splitViewController.viewControllers
              lastObject] isKindOfClass:[UINavigationController class]])
            currentDetailViewController =
            (DetailViewController *) ((UINavigationController *)
                                      [self.splitViewController.viewControllers
                                       lastObject]).topViewController;
        else
            currentDetailViewController = [self.splitViewController.viewControllers
                                           lastObject];
        if(currentDetailViewController.masterPopoverController
           != nil)
            [currentDetailViewController.masterPopoverController
             dismissPopoverAnimated:YES];
        
        DetailViewController
        *destinationDetailViewController;
        
        if ([segue.destinationViewController isKindOfClass:[UINavigationController class]])
            destinationDetailViewController =
            (DetailViewController *)
            ((UINavigationController *)
             segue.destinationViewController).topViewController;
        else
            destinationDetailViewController =
            segue.destinationViewController;
        self.splitViewController.delegate =
        destinationDetailViewController;
        destinationDetailViewController.popOverButton =
        currentDetailViewController.popOverButton;
        destinationDetailViewController.
        masterPopoverController =
        currentDetailViewController.masterPopoverController;
    }
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    [tableView deselectRowAtIndexPath:indexPath
                             animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
}

- (IBAction)handleSwipeGesture:(id)sender {
    
    UIStoryboard *storyboard =
    [UIStoryboard storyboardWithName:@"Main_iPad"
                              bundle:nil];
    UIViewController *viewController =
    [storyboard instantiateViewControllerWithIdentifier:
     @"TestDrive"];
    [[self navigationController]
     pushViewController:viewController animated:YES];
}

@end
