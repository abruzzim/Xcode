//
//  TestDriveController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/3/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "TestDriveController.h"

@interface TestDriveController ()
@property (weak, nonatomic) IBOutlet UIImageView *car;
@property (weak, nonatomic) IBOutlet UIButton *testDriveButton;
- (IBAction)testDrive:(id)sender;

@end

@implementation TestDriveController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)testDrive:(id)sender {
}
@end
