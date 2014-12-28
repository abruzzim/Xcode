//
//  AppDelegate.m
//  InstaPhoto
//
//  Created by Mario Abruzzi on 12/27/14.
//  Copyright (c) 2014 FWS. All rights reserved.
//

#import "AppDelegate.h"
#import "FeedViewController.h"
#import "FavoritesViewController.h"
#import "ProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Instantiate the Custom View Controllers
    FeedViewController *feedViewController = [[FeedViewController alloc] init];
    
    FavoritesViewController *favoritesViewController = [[FavoritesViewController alloc] init];
    
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    
    // Instantiate a Tab Bar Controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    // Add View Controllers to the Tab Bar Controller
    [tabBarController setViewControllers:@[feedViewController, favoritesViewController, profileViewController]
                                animated:YES];
    
    // Set the window to the physical device screen.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Set the window's root view controller to the Tab Bar Controller instance.
    self.window.rootViewController = tabBarController;
    
    // Send the message to the window to make the view visible.
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
