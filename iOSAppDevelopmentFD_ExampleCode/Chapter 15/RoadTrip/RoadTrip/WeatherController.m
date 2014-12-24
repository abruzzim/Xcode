//
//  WeatherController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/5/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "WeatherController.h"
#import "AppDelegate.h"
#import "Trip.h"

@interface WeatherController ()
@property (strong, nonatomic) UIBarButtonItem *backButton;
@end

@implementation WeatherController

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
    
    self.title = @"Weather";
    self.weatherView.scalesPageToFit = YES;
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    self.backButton = [[UIBarButtonItem alloc]
                                   initWithTitle:[NSString stringWithFormat: @"Back to %@", self.title]
                                   style:UIBarButtonItemStyleBordered
                                   target:self
                                   action:@selector(goBack:)];
    [self.weatherView loadRequest:
     [NSURLRequest requestWithURL:[NSURL
                                   URLWithString:[appDelegate.trip weather]]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:
(NSURLRequest *)request navigationType:
(UIWebViewNavigationType)navigationType {
    
    if (navigationType == UIWebViewNavigationTypeLinkClicked){
        if ([[UIDevice currentDevice]
             userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            if (![self.toolbar.items containsObject: self.backButton])
            {
                NSMutableArray *itemsArray = [self.toolbar.items mutableCopy];
                [itemsArray addObject:self.backButton ];
                [self.toolbar setItems:itemsArray animated:NO];
            }
        }
        else {
            self.navigationItem.rightBarButtonItem = self.backButton;
        }
    }
    return YES;
}

- (void)goBack:(id)sender {
    [self.weatherView goBack];
}

- (void)webViewDidFinishLoad:(UIWebView *) webView {
    
    if ([self.weatherView canGoBack] == NO ) {
        NSUInteger backButtonIndex = [self.toolbar.items indexOfObject: self.backButton];
        
        if (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) && (backButtonIndex != NSNotFound))
        {
            NSMutableArray *itemsArray =
            [self.toolbar.items mutableCopy];
            [itemsArray removeObject: self.backButton];
            [self.toolbar setItems:itemsArray animated:NO];
            NSLog (@" %lu", (unsigned long)[self.toolbar.items indexOfObject: self.backButton]);
        }
        else {
            self.navigationItem.rightBarButtonItem = nil;
        }
    }
}

@end
