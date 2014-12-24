//
//  Card.h
//  Matchismo
//
//  Created by abruzzim on 11/30/14.
//  Copyright (c) 2014 Framework Solutions, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

// Declare both the public "setter" and "getter" methods
// for the "contents" property. Public means that these
// methods can be called from outside the class's
// @implementation block.

@property (strong, nonatomic) NSString *contents;

// Declare primative type properties not stored in the heap.
// Boolean "getters" are typically renamed.

@property (nonatomic, getter = isChosen) BOOL chosen;
@property (nonatomic, getter = isMatched) BOOL matched;

// Declare the "match:" public method that takes one argument.
// (Method type identifier, Return type, Method signature keywords, Param type, Param name)

// - (int)match:(Card *)card;

- (int)match:(NSArray *)otherCards;

@end
