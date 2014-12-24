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
#import "FindController.h"

@interface MasterViewController () {
    NSMutableArray *_objects;
}
@property (weak, nonatomic) IBOutlet UITextField *findText;
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
    
    UISwipeGestureRecognizer *swipeGesture =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self
                                              action:@selector(handleSwipeGesture:)];
    swipeGesture.direction =
    UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGesture];
    self.findText.delegate = self;
    
    if(appDelegate.destinationPreference == nil) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"Welcome to Road Trip"
                              message:@"Please select a Destination from the Road Trip Menu"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)prepareForSegue:
(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"Destination"]) {
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] ==
            UIUserInterfaceIdiomPad) {
            DetailViewController *currentDetailViewController;
            
            DestinationController *destinationController = (DestinationController *)
            segue.destinationViewController;
            destinationController.delegate = self;
            
            if ([[self.splitViewController.viewControllers
                  lastObject]
                 isKindOfClass:[UINavigationController class]]) {
                UINavigationController *navigationController = [self.splitViewController.viewControllers
                                                                lastObject];
                currentDetailViewController =
                (DetailViewController *)
                navigationController.topViewController;
            }
            else
                currentDetailViewController = [self.splitViewController.viewControllers
                                               lastObject];
            if (currentDetailViewController.
                masterPopoverController != nil)
                
                [currentDetailViewController.
                 masterPopoverController
                 dismissPopoverAnimated:YES];
        }
        else {
            DestinationController *destinationController = (DestinationController *)
            segue.destinationViewController;
            destinationController.delegate = self;
        }
        return;
    }
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        FindController * findController =
        [[UIStoryboard
          storyboardWithName:@"Main_iPad" bundle:nil]
         instantiateViewControllerWithIdentifier:@"Find"];
        findController.findLocation = textField.text;
        
        DetailViewController *currentDetailViewController;
        currentDetailViewController =
        [self.splitViewController.viewControllers lastObject];
        if (
            currentDetailViewController.masterPopoverController != nil)
            [currentDetailViewController.
             masterPopoverController
             dismissPopoverAnimated:YES];
        
        self.splitViewController.delegate = findController;
        findController.popOverButton =
        currentDetailViewController.popOverButton;
        findController.masterPopoverController =
        currentDetailViewController.
        masterPopoverController;
        
        NSMutableArray* controllers =
        [NSMutableArray arrayWithObjects:
         (self.splitViewController.viewControllers)[0],
         findController, nil];
        self.splitViewController.viewControllers =
        controllers;
        
    }
    else {
        FindController *findController =
        [[UIStoryboard
          storyboardWithName:@"Main_iPhone"
          bundle:nil]
         instantiateViewControllerWithIdentifier:@"Find"];
        findController.findLocation = textField.text;
        [self.navigationController
         pushViewController:findController animated:YES];
    }
    return YES;
}

- (void)destinationController:(DestinationController *)
controller didFinishWithSave:(BOOL)save {
    
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    
    if (save) {
        [appDelegate createDestinationModel:
         controller.selectedDestination];
        [self viewDidLoad];
        DetailViewController* currentDetailViewController;
        if ([[self.splitViewController.viewControllers
              lastObject]
             isKindOfClass:[UINavigationController class]]) {
            UINavigationController *navigationController = [self.splitViewController.viewControllers
                                                            lastObject];
            currentDetailViewController = (DetailViewController *)
            navigationController.topViewController;
        }
        else
            currentDetailViewController = [self.splitViewController.viewControllers
                                           lastObject];
        [currentDetailViewController viewDidLoad];
        
        if (currentDetailViewController.popOverButton) {
            if (![[self.splitViewController.viewControllers
                   lastObject]
                  isKindOfClass:[UINavigationController class]]) {
                NSMutableArray *itemsArray = [currentDetailViewController.toolbar.items
                                              mutableCopy];
                [itemsArray removeObjectAtIndex:0];
                [currentDetailViewController.toolbar
                 setItems:itemsArray animated:NO];
            }
        }
        if ([currentDetailViewController isKindOfClass:[MapController class]]) {
            NSMutableArray *itemsArray =
            [currentDetailViewController.toolbar.items
             mutableCopy];
            [itemsArray removeLastObject];
            [currentDetailViewController.toolbar
             setItems:itemsArray animated:NO];
        }
    }
    if (appDelegate.trip == nil)
        [appDelegate createDestinationModel:0];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
