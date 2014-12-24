//
//  PlayingCard.h
//  Matchismo
//
//  Created by abruzzim on 12/1/14.
//  Copyright (c) 2014 Framework Solutions, LLC. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

// Make the validSuits and maxRank class methods public.

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
