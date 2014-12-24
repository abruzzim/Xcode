//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by abruzzim on 12/2/14.
//
//  This class represents a full 52-card deck of PlayingCards

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    // Override the "init" method that "Deck" inherited from "NSObject".
    
    // Assign "nil" to "self" if the super class cannot be initialized,
    // which will prevent us from initializing ourself.
    
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
