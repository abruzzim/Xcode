//
//  Trip.m
//  RoadTrip
//
//  Created by Wiley Publishing on 2/4/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import "Trip.h"
#import "Destination.h"
#import "Events.h"
#import "Annotation.h"

@interface Trip ()
@property (strong, nonatomic) NSDictionary *destinationData;
@property (strong, nonatomic) Destination* destination;
@property (strong, nonatomic) Events * events;
@property (strong, nonatomic) NSMutableArray *pois;
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
        _events = [[Events alloc]
                  initWithDestinationIndex:destinationIndex];
        NSArray *poiData = self.destinationData[@"POIs"];
        _pois = [[NSMutableArray alloc]
                 initWithCapacity:[ poiData count]+1];
        [_pois addObject: self.destination];
        
        for (NSDictionary *aPOI in poiData) {
            Annotation *annotation = [[Annotation alloc] init];
            CLLocationCoordinate2D coordinate;
            coordinate.latitude =
            [aPOI[@"Latitude"] doubleValue];
            coordinate.longitude =
            [aPOI[@"Longitude"] doubleValue];
            
            annotation.coordinate = coordinate;
            annotation.title = aPOI[@"Title"];
            annotation.subtitle = aPOI[@"Subtitle"];
            [self.pois addObject:annotation];
        }
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

- (NSUInteger)numberOfEvents {
    
    return [self.events numberOfEvents];
}

- (NSString *)getEvent:(NSUInteger)index {
    
    return [self.events getEvent:index];
}

- (NSArray *)createAnnotations {
    
    return self.pois;
}

- (NSString *)mapTitle {
    
    return self.destination.destinationName;
}
@end
