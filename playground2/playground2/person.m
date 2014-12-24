//
//  person.m
//  playground2
//
//  Created by Mario Abruzzi on 11/23/14.
//  Copyright (c) 2014 FWS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "person.h"

@implementation Person

- (void) dspFName; {
    NSLog(@"My first name is %@.", self.fName);
}

- (NSString *) fullName; {
    NSString *message = [NSString stringWithFormat:@"%@ %@", self.fName, self.lName];
    return message;
}

- (NSString *) speak:(NSString *)phrase; {
    NSString *sentence = [NSString stringWithFormat:@"%@ says %@", self.fName, phrase];
    return sentence;
}

- (void) dspAge:(NSNumber *)age; {
    NSLog(@"%@ is %@ years old.", self.fName, age);
}

- (void) decreaseWeight:(NSNumber *)wtChange; {
    self.weight = @([self.weight intValue] - ([wtChange intValue]));
}

- (void) setLName:(NSString *)lastName {
    _lName = lastName;
}

@end