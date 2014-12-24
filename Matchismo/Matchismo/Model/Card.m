//
//  Card.m
//  Matchismo
//
//  Created by abruzzim on 11/30/14.
//  Copyright (c) 2014 Framework Solutions, LLC. All rights reserved.
//

#import "Card.h"

// Private declaration or Class extension

@interface Card()

@end

@implementation Card

/*
 
 // The compiler automatically generates the "setter" and "getter" code
 // as a result of the @property declaration.

@synthesize contents = _contents; // Create backing instance variable.

- (NSString *)contents
{
    return _contents;
}

- (void)setContents:(NSString *)contents
{
    _contents = contents;
}
 
 */

/*
 
 // Here is the compiler generated code as a result of
 // the "chosen" and "matched" @property declarations.
 
@synthesize chosen = _chosen;
@synthesize matched = _matched;
 
- (BOOL)isChosen
{
    return _chosen;
}
 
- (void)setChosen:(BOOL)chosen
{
    _chosen = chosen;
}
 
- (BOOL)isMatched
{
    return _matched;
}
 
- (void)setMatched:(BOOL)matched
{
    _matched = matched;
}
 
 */

// - (int)match:(Card *)card

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    // If the passed card has the same contents as we do
    // then the score is assigned a value of 1.
    // Note that dot notation is used only for "setters"
    // and "getters". Square bracket notation is used to
    // send a message to an object.

    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    return score;
}

@end
