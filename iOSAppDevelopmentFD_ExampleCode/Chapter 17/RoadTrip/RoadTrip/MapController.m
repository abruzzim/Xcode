//
//  MapController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/8/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "MapController.h"
#import "AppDelegate.h"
#import "Trip.h"

@interface MapController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)mapType:(id)sender;
- (void)setInitialRegion;
- (void)addAnnotations;
- (NSString *)mapTitle;
@end

@implementation MapController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = YES;
    [self setInitialRegion];
    AppDelegate* appDelegate = [[UIApplication
                                 sharedApplication] delegate];
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==
        UIUserInterfaceIdiomPad) {
        UILabel * titleLabel = [[UILabel alloc]
                                initWithFrame:CGRectMake (0,0,250,44)];
        titleLabel.font = [UIFont boldSystemFontOfSize:17];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.text = [self mapTitle];
        UIBarButtonItem *titleView = [[UIBarButtonItem alloc]
                                      initWithCustomView:titleLabel];
        UIBarButtonItem *flexibleSpace=
        [[UIBarButtonItem alloc] initWithBarButtonSystemItem:
         UIBarButtonSystemItemFlexibleSpace
                                                      target:nil action:nil];
        flexibleSpace.width = 1.0;
        NSMutableArray *itemsArray =
        [self.toolbar.items mutableCopy];
        [itemsArray insertObject:flexibleSpace atIndex:
         [itemsArray count]-2];
        [itemsArray insertObject:titleView atIndex:
         [itemsArray count]-2];
        [self.toolbar setItems:itemsArray animated:NO];
    }
    else
        self.title = [appDelegate.trip mapTitle];
    [self addAnnotations];
    
    /*UIBarButtonItem *locateButton = [[UIBarButtonItem alloc] initWithTitle:@"Locate" style:UIBarButtonItemStyleBordered target:self action:@selector(goToLocation:)];;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSMutableArray *itemsArray =
        [self.toolbar.items mutableCopy];
        [itemsArray insertObject:locateButton
                         atIndex:[itemsArray count]];
        [self.toolbar setItems:itemsArray animated:NO];
    }
    else {
        self.navigationItem.rightBarButtonItem = locateButton;
    }*/
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)mapType:(id)sender {
    self.mapView.mapType =
    ((UISegmentedControl *)sender).selectedSegmentIndex;
}

- (void) setInitialRegion {
    
    AppDelegate* appDelegate =
    [[UIApplication sharedApplication] delegate];
    MKCoordinateRegion region;
    CLLocationCoordinate2D  initialCoordinate =
    [appDelegate.trip destinationCoordinate];
    region.center.latitude = initialCoordinate.latitude;
    region.center.longitude = initialCoordinate.longitude;
    region.span.latitudeDelta = .05;
    region.span.longitudeDelta = .05;
    [self.mapView setRegion:region animated:NO];
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView
                       withError:(NSError *)error {
    
    NSLog(@"Unresolved error %@, %@", error,
          [error userInfo]);
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Unable to load the map"
                          message:@"Check to see if you have internet access"
                          delegate:self cancelButtonTitle: @"Thanks"
                          otherButtonTitles:nil];
    [alert show];
}

- (NSString *)mapTitle {
    
    AppDelegate* appDelegate = [[UIApplication
                                 sharedApplication] delegate];
    
    return [appDelegate.trip mapTitle];
}

- (void)addAnnotations {
    
    AppDelegate* appDelegate =
    [[UIApplication sharedApplication] delegate];
    [self.mapView addAnnotations:
     [appDelegate.trip createAnnotations]];
}

- (void)goToLocation:(id)sender {
    
    MKUserLocation *annotation = self.mapView.userLocation;
    CLLocation *location = annotation.location;
    if (nil == location)
        return;
    CLLocationDistance distance = MAX(4*location.horizontalAccuracy,500);
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance
    (location.coordinate, distance, distance);
    [self.mapView setRegion:region animated:NO];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==
        UIUserInterfaceIdiomPad) {
        NSArray *itemsArray = self.toolbar.items;
        
        UIBarButtonItem *locateButton = [itemsArray
                                         objectAtIndex:[itemsArray count]-1];
        locateButton.action = @selector(goToDestination:);
        locateButton.title = @"Destination";
    }
    else {
        self.navigationItem.rightBarButtonItem.action =
        @selector(goToDestination:);
        self.navigationItem.rightBarButtonItem.title =
        @"Destination";
    }
}

- (void)goToDestination:(id)sender {
    
    [self setInitialRegion];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSArray *itemsArray = self.toolbar.items;
        UIBarButtonItem *locateButton = [itemsArray objectAtIndex:[itemsArray count]-1];
        locateButton.action = @selector(goToLocation:);
        locateButton.title = @"Locate";
    }
    else {
        self.navigationItem.rightBarButtonItem.action =
        @selector(goToLocation:);
        self.navigationItem.rightBarButtonItem.title =
        @"Locate";
    }
}

@end
