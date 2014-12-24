//
//  EventsController.h
//  RoadTrip
//
//  Created by Wiley Publishing on 2/7/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "DetailViewController.h"
@class EventPageController;

@interface EventsController : DetailViewController <UIPageViewControllerDelegate,
UIPageViewControllerDataSource>

- (EventPageController *)viewControllerAtIndex: (NSUInteger)index storyboard:(UIStoryboard *)storyboard;

@end
