//
//  main.m
//  playground2
//
//  Created by Mario Abruzzi on 11/23/14.
//  Copyright (c) 2014 FWS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Instantiate a Person object
        Person *me = [[Person alloc] init];
        
        // Set the properties
        me.fName = @"Mario";
        // [me setLName:@"Abruzzi"];
        me.lName = @"Abruzzi";
        me.weight = @195;
        
        // Display first name
        me.dspFName;
        
        // Call fullName instance method 1
        NSString *myFullName = me.fullName;
        NSLog(@"My full name is %@.", myFullName);
        
        // Call fullName instance method 2
        NSLog(@"My full name is %@.", me.fullName);
        
        // Call fullName instance method 3
        NSLog(@"My full name is %@.", [me fullName]);
        
        // Call speak instance method 1
        NSString *aSentence = [me speak:@"Shut up turds!"];
        NSLog(@"%@", aSentence);
        
        // Call speak instance method 2
        NSLog(@"%@", [me speak:@"Shut up turds again!"]);
        
        // Call dspAge instance method
        [me dspAge:@49];
        
        // Call decreaseWeight instance method
        NSLog(@"The current weight is %@", me.weight);
        [me decreaseWeight:@7];
        NSLog(@"The new weight is %@", me.weight);
    }
    return 0;
}
