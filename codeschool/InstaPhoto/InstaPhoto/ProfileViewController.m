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
