//
//  FindController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/9/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "FindController.h"
#import "AppDelegate.h"
#import "Trip.h"
#import "Annotation.h"

@interface FindController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation FindController

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
    
    self.title = self.findLocation;
    
    void (^addFindLocationCompletionHandler)
    (Annotation *, NSError *) = ^(Annotation *annotation,
                                  NSError *error){
        if (error!= nil || annotation == nil) {
            NSLog(@"Geocoder Failure! Error code: %u, description: %@, and reason: %@", error.code,
                  [error localizedDescription],
                  [error localizedFailureReason]);
        }
        else {
            MKCoordinateRegion region;
            region.center.latitude =
            annotation.coordinate.latitude;
            region.center.longitude =
            annotation.coordinate.longitude;
            region.span.latitudeDelta = .05;
            region.span.longitudeDelta = .05;
            [self.mapView setRegion:region animated:NO];
            [self.mapView addAnnotation:annotation];
        }
    };
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    [appDelegate.trip addLocation:self.findLocation
                completionHandler:addFindLocationCompletionHandler];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *)mapTitle {
    
    return  self.findLocation;
}

@end
