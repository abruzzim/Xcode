//
//  PlayingCard.m
//  Matchismo
//
//  Created by abruzzim on 12/1/14.
//  Copyright (c) 2014 Framework Solutions, LLC. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

// Override the superclass's "getter" method of the "contents" property
// so that it returns a more appropriate NSString for PlayingCard.

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

/*
 
 // This is the automatically generated compiler "setter" and "getter" code
 // as a result of the @property declaration in the header file.
 
 @synthesize suit = _suit; // Create backing store instance variable.
 
 - (NSString *)suit
 {
    return _suit;
 }
 
 - (void)setSuit:(NSString *)suit
 {
    _suit = suit;
 }
 
 */

// Create the instance variable for the "suit" @property since BOTH
// "setter" and "getter" methods will be overridden.

@synthesize suit = _suit;

// Create class methods that defines the rank strings, maximum rank and valid suits.

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count]-1;
}

+ (NSArray *)validSuits
{
    return @[@"♥️",@"♦️",@"♠️",@"♣️"];
}

// Override the compiler generated "setter" for "suit" to validate characters.

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// Override the compiler generated "getter" for "suit" to return a "?" for a "nil" suit.

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

// "Setter" method to validate the maximum rank.

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
@end
