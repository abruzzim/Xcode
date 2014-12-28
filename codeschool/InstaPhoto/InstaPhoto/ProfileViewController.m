//
//  ProfileViewController.m
//  InstaPhoto
//
//  Created by Mario Abruzzi on 12/28/14.
//  Copyright (c) 2014 FWS. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Custom view controller behavior.
    self.title = @"Profile";
    self.view.backgroundColor = [UIColor yellowColor];
    self.tabBarItem.image = [UIImage imageNamed:@"Profile"];
    
    // Create an image view object to display an image.
    UIImageView *myView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Me.jpg"]];
    
/*
    // Scale content to fit in the view's frame, while
    // preserving the original aspect ratio.
    [myView setContentMode:UIViewContentModeScaleAspectFill];
    
    // Set the frame, which descibes the view's location and size
    // in its superview's coordinate system.
    myView.frame = self.view.frame;
*/
    // Reduce the size of the image by specifying a CGRect
    myView.frame = CGRectMake(20, 30, 100, 160);
    
    // Add the profile view as a subview.
    [self.view addSubview:myView];
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
