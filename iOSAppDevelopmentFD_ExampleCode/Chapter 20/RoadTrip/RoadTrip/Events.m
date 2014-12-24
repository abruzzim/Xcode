//
//  Events.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/7/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "Events.h"

@interface Events ()
    @property (strong, nonatomic) NSMutableArray *events;

@end

@implementation Events

- (id)initWithDestinationIndex:
(NSUInteger)destinationIndex {
    self = [super init];
    if (self) {
        
        NSString *filePath = [[NSBundle mainBundle]
                              pathForResource:@"Destinations" ofType:@"plist"];
        NSDictionary *destinations = [NSDictionary
                                        dictionaryWithContentsOfFile: filePath];
        NSArray *destinationsArray =
        destinations[@"DestinationData"];
        NSDictionary *data =
        destinationsArray[destinationIndex];
        self.events = [NSMutableArray arrayWithArray:
                       data[@"Events"]];   
    }
    return self;
}

- (NSUInteger)numberOfEvents {
    
    return [self.events count];
}

- (NSString *)getEvent:(NSUInteger)index {
    
    return self.events[index];
}

@end
