//
//  TestDriveController.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/3/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "TestDriveController.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface TestDriveController () {
    BOOL touchInCar;
    AVAudioPlayer *backgroundAudioPlayer;
    SystemSoundID burnRubberSoundID;
}
@property (weak, nonatomic) IBOutlet UIImageView *car;
@property (weak, nonatomic) IBOutlet UIButton *testDriveButton;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
- (IBAction)testDrive:(id)sender;
- (void)rotate;
- (void)returnCar;
//- (void)continueRotation;
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
    
    NSURL* backgroundURL = [NSURL fileURLWithPath:
                            [[NSBundle mainBundle]pathForResource:
                             @"CarRunning" ofType:@"aif"]];
    backgroundAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundURL error:nil];
    backgroundAudioPlayer.numberOfLoops = -1;
    [backgroundAudioPlayer prepareToPlay];
    
    NSURL* burnRubberURL = [NSURL fileURLWithPath:
                            [[NSBundle mainBundle] pathForResource:
                             @"BurnRubber" ofType:@"aif"]];
    AudioServicesCreateSystemSoundID(
                                     (__bridge CFURLRef)burnRubberURL, &burnRubberSoundID);
    [self.testDriveButton setBackgroundImage:[UIImage animatedImageNamed:@"Button" duration:1.0 ] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)testDrive:(id)sender {
    NSLog (@" %f  %f %f %f  %f %f", self.view.frame.origin.x,
           self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height, self.view.center.x, self.view.center.y);
   
    AudioServicesPlaySystemSound(burnRubberSoundID);
    [self performSelector:@selector(playCarSound)
               withObject:self afterDelay:.2];
    CGPoint center = CGPointMake(self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height +15); ///2);
    
    void (^animation)() = ^(){
       self.car.center = center;
        //[self rotate];
        //[self.view layoutIfNeeded];

    };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        //[self returnCar];
        [self rotate];
         //self.car.center = center;

    };

    [UIView animateWithDuration:3 animations:animation completion:completion];

}

- (void)rotate {
     CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI);
   // [self.view layoutIfNeeded];
    //self.view.translatesAutoresizingMaskIntoConstraints = YES;

    void (^animation)() = ^(){
        self.car.transform = transform;
        //[self.view layoutIfNeeded];

        //[self returnCar];
    };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        [self returnCar];
    };
    
    [UIView animateWithDuration:3 animations:animation completion:completion];
}

- (void)returnCar {
    CGPoint center = CGPointMake (self.view.center.x, self.view.frame.size.height - self.car.frame.size.height); //self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height - 7);
    NSLog (@"frame origin %f  %f frame size %f %f  view center %f %f car %f %f center %f %f", self.view.frame.origin.x, self.view.frame.origin.y,
        self.view.frame.size.width, self.view.frame.size.height,
        self.view.center.x, self.view.center.y,
        self.car.center.x, self.car.center.y,
        center.x, center.y);
    
    //CGPoint center = CGPointMake (self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height - 7);
    //CGPoint center = CGPointMake(0, 400); //self.car.center.x, self.view.frame.origin.y + self.car.frame.size.height - 7 - self.car.frame.size.height/2);
    
    void (^animation)() = ^(){
        self.car.center = center;
        //[self.view layoutIfNeeded];
            };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        [self continueRotation];
    };

    [UIView animateWithDuration:3 animations:animation completion:completion];
}

- (void)continueRotation {
    
    CGAffineTransform transform =
    CGAffineTransformMakeRotation(0);
    
    void (^animation)() = ^() {
        self.car.transform = transform;
    };
    
    void (^completion)(BOOL) = ^(BOOL finished){
        [backgroundAudioPlayer stop];
        [backgroundAudioPlayer prepareToPlay];
    };
    
    [UIView animateWithDuration:3 animations:animation
                     completion:completion];
}

//center = CGPointMake(self.car.center.x, self.view.frame.origin.y + self.
/*
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
    
}*/

- (void)playCarSound {
    
    [backgroundAudioPlayer play];
}

- (void)touchesBegan:(NSSet *)touches withEvent:
(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if (CGRectContainsPoint(self.car.frame,
                            [touch locationInView:self.view]))
        touchInCar = YES;
    else  {
        touchInCar = NO;
        [super touchesBegan:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:
(UIEvent *)event {
    
    if (touchInCar) {
        UITouch* touch = [touches anyObject];
        _car.center = [touch locationInView:self.view];
    }
    else
        [super touchesMoved:touches withEvent:event];
}


@end
