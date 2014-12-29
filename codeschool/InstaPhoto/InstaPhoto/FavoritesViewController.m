//
//  FavoritesViewController.m
//  InstaPhoto
//
//  Created by Mario Abruzzi on 12/28/14.
//  Copyright (c) 2014 FWS. All rights reserved.
//

#import "FavoritesViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Custom view controller behavior.
    self.title = @"Favorites";
    self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.tabBarItem.image = [UIImage imageNamed:@"Favorite"];
    
    // Create an image view object to display an image.
    UIImageView *myLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tapestry_logo.jpg"]];
    
    // Scale content to fit in the view's frame, while
    // preserving the original aspect ratio.
    [myLogo setContentMode:UIViewContentModeScaleAspectFill];
    
    // Set the frame, which descibes the view's location and size
    // in its superview's coordinate system.
    //// Deprecated with Nav Controller --> myLogo.frame = self.view.frame;
    // Define a CG Rectangle to offset the image when using a Nav Controller
    myLogo.frame = CGRectMake(20, 80, 64, 64);
    
    // Add the profile view as a subview.
    [self.view addSubview:myLogo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
