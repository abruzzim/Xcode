//
//  Trip.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/4/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "Trip.h"

#import "Destination.h"

@interface Trip ()
@property (strong, nonatomic) NSDictionary *destinationData;
@property (strong, nonatomic) Destination* destination;
@end

@implementation Trip

- (instancetype)initWithDestinationIndex:(int)destinationIndex {
    NSLog (@" %d", destinationIndex);
    if ((self = [super init])) {
        
        NSString *filePath = [[NSBundle mainBundle]
                              pathForResource:@"Destinations" ofType:@"plist"];
        NSDictionary *destinations = [NSDictionary dictionaryWithContentsOfFile:filePath];
        NSArray *destinationsArray = destinations[@"DestinationData"];
        _destinationData = destinationsArray[destinationIndex];
        _destination = [[Destination alloc] initWithDestinationIndex:destinationIndex];
    }
    return self;
}

- (UIImage *) destinationImage {
    
    return  self.destination.destinationImage;
}

- (NSString *) destinationName {
    
    return  self.destination.destinationName;
}

- (CLLocationCoordinate2D) destinationCoordinate {
    
    return self.destination.coordinate;
}

- (NSString *)weather {
    
    return _destinationData[@"Weather"];
}

@end
