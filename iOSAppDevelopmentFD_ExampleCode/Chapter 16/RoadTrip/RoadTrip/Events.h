//
//  Events.h
//  RoadTrip
//
//  Created by Wiley Publishing on 2/7/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Events : NSObject

- (id)initWithDestinationIndex: (NSUInteger)destinationIndex;
- (NSUInteger)numberOfEvents;
- (NSString *)getEvent:(NSUInteger)index;

@end
