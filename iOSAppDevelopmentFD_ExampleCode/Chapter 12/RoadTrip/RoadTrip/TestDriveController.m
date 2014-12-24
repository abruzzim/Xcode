//
//  TestDriveController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/3/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "TestDriveController.h"

@interface TestDriveController () {
    BOOL touchInCar;
}
@property (weak, nonatomic) IBOutlet UIImageView *car;
@property (weak, nonatomic) IBOutlet UIButton *testDriveButton;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)testDrive:(id)sender;
- (void)rotate;
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

    
    //AudioServicesPlaySystemSound(burnRubberSoundID);
    //[self performSelector:@selector(playCarSound) withObject:self afterDelay:.2];
    CGPoint center = CGPointMake(self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height/2 + self.toolbar.frame.size.height);
    
    NSLog (@" testDrive start  %f %f %f %f", center.x, center.y, self.car.center.x, self.car.center.y);

    void (^animation)() = ^(){
        self.car.center = center;
        NSLog (@" testDrive animation  %f %f %f %f", center.x, center.y, self.car.center.x, self.car.center.y);
    };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        //[self returnCar];
        [self rotate];
                NSLog (@" testDrive completion end");
    };
    
    [UIView animateWithDuration:3 animations:animation completion:completion];
    center = CGPointMake(self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height/2 + self.toolbar.frame.size.height+100);
    self.car.center = center;

     NSLog (@" testDrive end  %f %f %f %f", center.x, center.y, self.car.center.x, self.car.center.y);
}

 - (void)rotate {
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI);
    self.car.transform = transform;

     NSLog (@"  rotate begin %f ",  self.view.frame.origin.y);
    NSLog (@" %f ",  self.car.frame.size.height/2);
    NSLog (@" %f ",  self.toolbar.frame.size.height);
    NSLog (@" %f %f", self.car.center.x, self.car.center.y);
    
    transform = CGAffineTransformMakeRotation(M_PI);
    NSLog (@" %f %f %f %f %f %f", transform.a, transform.b, transform.c, transform.d, transform.tx, transform.ty);
    NSLog (@" %@", self.car);
    
    void (^animation)()  =  ^(){
        NSLog (@" rotate animation begin %f %f", self.car.center.x, self.car.center.y);
        self.car.transform = transform;
    };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        //[self returnCar];
        NSLog (@" rotate completion end %f %f", self.car.center.x, self.car.center.y);
        
    };
    
    [UIView animateWithDuration:3 animations:animation completion:completion];
    
}



@end
