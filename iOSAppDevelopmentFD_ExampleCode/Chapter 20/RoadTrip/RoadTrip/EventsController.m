//
//  EventsController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/7/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "EventsController.h"
#import "AppDelegate.h"
#import "Trip.h"
#import "EventPageController.h"

@interface EventsController ()

@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (nonatomic) NSUInteger pageCount;
@property (nonatomic) NSUInteger currentPage;

@end

@implementation EventsController

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
    
    //self.navigationController.navigationBar.tintColor =
    //[UIColor blackColor]; **JF to revisit tintColor
    AppDelegate *delegate =
    [[UIApplication sharedApplication] delegate];
    self.pageCount = [delegate.trip numberOfEvents];
    self.pageViewController = [[UIPageViewController alloc]
                               initWithTransitionStyle:
                               UIPageViewControllerTransitionStylePageCurl
                               navigationOrientation:
                               UIPageViewControllerNavigationOrientationHorizontal
                               options:nil];
    self.pageViewController.dataSource = self;
    EventPageController *startingViewController =
    [self viewControllerAtIndex:0
                     storyboard:self.storyboard];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers
                                      direction:
     UIPageViewControllerNavigationDirectionForward
                                       animated:NO completion:NULL];
    [self addChildViewController: self.pageViewController];
    [self.pageViewController didMoveToParentViewController:self];
    
    [self.view addSubview:self.pageViewController.view];
    self.view.gestureRecognizers = self.pageViewController.gestureRecognizers;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (EventPageController *)viewControllerAtIndex:
(NSUInteger)index
                                    storyboard:(UIStoryboard *)storyboard {
    
    if ((self.pageCount == 0) || (index >= self.pageCount)) {
        return nil;
    }
    EventPageController *eventPageController = [storyboard
        instantiateViewControllerWithIdentifier:@"Event Page"];
    eventPageController.page = index;
    return eventPageController;
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:
(UIViewController *)viewController {
    
    NSUInteger index =
    ((EventPageController *)viewController).page;
    if (index == 0)
        return nil;
    index--;
    self.currentPage = index;
    return [self viewControllerAtIndex:index
                            storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:
(UIPageViewController *)pageViewController
       viewControllerAfterViewController:
(UIViewController *)viewController {
    NSUInteger index =
    ((EventPageController *)viewController).page;
    index++;
    if (index == self.pageCount)
        return nil;
    self.currentPage = index;
    return [self viewControllerAtIndex:index
                            storyboard:viewController.storyboard];
}

@end
