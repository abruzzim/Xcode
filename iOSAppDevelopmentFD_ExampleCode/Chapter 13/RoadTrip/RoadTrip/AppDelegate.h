//
//  AppDelegate.h
//  RoadTrip
//
//  Created by Jesse Feiler on 11/27/13.
//  Copyright (c) 2013 Jesse Feiler. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Trip;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) Trip *trip;

- (void) createDestinationModel:(int)destinationIndex;

@end
