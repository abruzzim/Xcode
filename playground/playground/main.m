//
//  main.m
//  playground
//
//  Created by Mario Abruzzi on 11/20/14.
//  Copyright (c) 2014 Mario Abruzzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoClass.h"

@interface Box : NSObject

{
    // Instance variables
    double length;
    double width;
}

// Syntax: @property(<access specifiers>) <datatype> <property-name>;
@property(nonatomic, readwrite) double height;

@end

@implementation Box

@synthesize height;

// Syntax: - (<return-type>) <method-name>:( <arg-type-1> )<arg-name-1>
- (id) init
{
    self = [super init];
    length = 1.0;
    width = 1.0;
    return self;
}

- (double) volume
{
    return length * width * height;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        DemoClass *demoInstance = [[DemoClass alloc]init];
        [demoInstance dspString];
        [demoInstance dspMemSizeInt];
        [demoInstance dspMemSizeFloat];
        
        // Create a box1 object of type Box.
        Box *boxInstance = [[Box alloc]init];
        
        // Declare volume variable.
        double volume = 0.0;
        
        // Specify box1 height.
        boxInstance.height = 10.0;
        
        // Calculate box1 volume.
        volume = [boxInstance volume];
        
        // Display boxInstance's volume.
        NSLog(@"The volume of boxInstance is %f units.", volume);
    }
    return 0;
}