//
//  DemoClass.m
//  playground
//
//  Created by Mario Abruzzi on 11/20/14.
//  Copyright (c) 2014 Mario Abruzzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoClass.h"

@implementation DemoClass

- (void)dspString{
    NSLog(@"String produced by dspString method. \n");
}
- (void)dspMemSizeInt{
    NSLog(@"Memory size of Int is: %lu bytes. \n", sizeof(int));
}
- (void)dspMemSizeFloat{
    NSLog(@"Memory size of Float is: %lu bytes. \n", sizeof(float));
}

@end
