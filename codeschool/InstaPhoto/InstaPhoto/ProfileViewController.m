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
    
    // Scroll View - class supports displaying content that is
    // larger than the size of the application's window.
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    // Set the interger bit mask that determines how the receiver resizes
    // itself when its superview's bounds change.
    self.scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    // Set the size of the content view.
    self.scrollView.contentSize = CGSizeMake(320, 850);
    
    /* Add Picture */
    
    // Create an image view object to display an image.
    UIImageView *myPic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Me.jpg"]];
    // Reduce the size of the image by specifying a CGRect
    myPic.frame = CGRectMake(20, 30, 100, 160);
    // Add the profile picture to the scroll subview.
    [self.scrollView addSubview:myPic];
    
    /* Add Name */
    
    // Initialize and return a newly allocated view object with the specified frame rectangle.
    UILabel *nameLbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 200, 280, 40)];
    // Set the text property.
    nameLbl.text = @"Name: Mario Abruzzi";
    // Add the view to the end of the receiver's list of subviews.
    [self.scrollView addSubview:nameLbl];
    
    /* Add City */
    
    UILabel *cityLbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 240, 280, 40)];
    cityLbl.text = @"From: New York";
    [self.scrollView addSubview:cityLbl];
    
    /* Add Bio */
    
    UITextView *bioText = [[UITextView alloc] initWithFrame:CGRectMake(30, 280, 150, 400)];
    // Set the text font.
    bioText.font = [UIFont fontWithName:@"Helvetica" size:15];
    // Boolean value indicating that this receiver is not editable.
    bioText.editable = NO;
    // Add text.
    bioText.text = @"Bio: Mario Abruzzi is coding along with Gregg Pollack, the founder of Envy Labs and teacher of multiple courses at Code School. Code School teaches web programming in the comfort of my browser with video lessons, coding chalenges and screencasts.";
    [self.scrollView addSubview:bioText];
    
    /* Add Membership */
    
    UILabel *memberSinceLbl = [[UILabel alloc] initWithFrame:CGRectMake(30, 700, 280, 40)];
    memberSinceLbl.text = @"Member Since: 1997";
    [self.scrollView addSubview:memberSinceLbl];
    
    // Add the scrollView to the view controller's view.
    [self.view addSubview:self.scrollView];
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
