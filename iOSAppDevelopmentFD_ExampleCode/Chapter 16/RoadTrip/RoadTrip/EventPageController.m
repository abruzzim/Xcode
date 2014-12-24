//
//  EventsPageControllerViewController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/7/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "EventPageController.h"
#import "AppDelegate.h"
#import "Trip.h"

@interface EventPageController ()
@property (weak, nonatomic) IBOutlet UIWebView *eventDataView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation EventPageController

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
    
    self.eventDataView.delegate = self;
    [self.activityIndicator startAnimating];
    self.activityIndicator.hidesWhenStopped = YES;
    [self.eventDataView setScalesPageToFit:YES];
    AppDelegate *appDelegate =
    [[UIApplication sharedApplication] delegate];
    [self.eventDataView loadRequest:
     [NSURLRequest requestWithURL:
      [NSURL URLWithString:
       [appDelegate.trip getEvent:self.page]]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    
    if (navigationType ==
        UIWebViewNavigationTypeLinkClicked) {
        UIBarButtonItem *backButton = [[UIBarButtonItem alloc]
                                       initWithTitle:[NSString stringWithFormat:
                                                      @"Back to %@", self.parentViewController.
                                                      parentViewController.title]
                                       style:UIBarButtonItemStylePlain target:self
                                       action:@selector(goBack:)];
        self.parentViewController.parentViewController.
        navigationItem.rightBarButtonItem = backButton;
        
        return YES;
    }
    else return YES;
}

- (void)goBack:(id)sender {
    
    [self.eventDataView goBack];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.activityIndicator stopAnimating];
    if ([self.eventDataView canGoBack] == NO ) {
        self.parentViewController.parentViewController.
        navigationItem.rightBarButtonItem = nil;
    }
}

@end
