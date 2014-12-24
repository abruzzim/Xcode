//
//  Deck.h
//  Matchismo
//
//  Created by abruzzim on 12/1/14.
//  Copyright (c) 2014 Framework Solutions, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

// Method to return a pointer to an instance of a Card in the heap.

- (Card *)drawRandomCard;

@end
