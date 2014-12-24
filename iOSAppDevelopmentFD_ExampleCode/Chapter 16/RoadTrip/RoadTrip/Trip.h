//
//  Trip.h
//  RoadTrip
//
//  Created by Wiley Publishing on 2/4/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Trip : NSObject
-(instancetype)initWithDestinationIndex:(int)destinationIndex;
- (UIImage *) destinationImage;
- (NSString *) destinationName;
- (CLLocationCoordinate2D) destinationCoordinate;
- (NSString *)weather;
- (NSUInteger)numberOfEvents;
- (NSString *)getEvent:(NSUInteger)index;
@end
