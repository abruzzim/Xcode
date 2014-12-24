//
//  Destination.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/4/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "Destination.h"

@implementation Destination
- (instancetype)initWithDestinationIndex: (NSUInteger)destinationIndex {
    
    self = [super init];
    if (self) {
        
        NSString *filePath = [[NSBundle mainBundle]
                              pathForResource:@"Destinations" ofType:@"plist"];
        NSDictionary *destinations = [NSDictionary
                                      dictionaryWithContentsOfFile:filePath];

        NSArray *destinationsArray = destinations[@"DestinationData"];
        NSDictionary *data = destinationsArray[destinationIndex];
        
        _destinationImage = [UIImage imageNamed:data[@"DestinationImage"]];
        _destinationName = data[@"DestinationName"];
        NSDictionary* destinationLocation = data[@"DestinationLocation"];
        CLLocationCoordinate2D destinationCoordinate;
        destinationCoordinate.latitude = [destinationLocation[@"Latitude"] doubleValue];
        destinationCoordinate.longitude = [destinationLocation [@"Longitude"] doubleValue];
        _coordinate = destinationCoordinate;
        _title = destinationLocation[@"Title"];
        _subtitle = destinationLocation[@"Subtitle"];
    }
    return self;
    
}



@end
