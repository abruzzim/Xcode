//
//  person.h
//  playground2
//
//  Created by Mario Abruzzi on 11/23/14.
//  Copyright (c) 2014 FWS. All rights reserved.
//

@interface Person : NSObject

// Property List

@property NSString *fName;
@property (readonly) NSString *lName;
@property NSNumber *weight;

// Method Declarations

- (void) dspFName;
- (NSString *) fullName;
- (NSString *) speak:(NSString *)phrase;
- (void) dspAge:(NSNumber *)age;
- (void) decreaseWeight:(NSNumber *)wtChange;
- (void) setLName:(NSString *)lastName;

@end
