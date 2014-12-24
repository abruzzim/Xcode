//
//  Destination.h
//  RoadTrip
//
//  Created by Wiley Publishing on 2/4/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Destination : NSObject
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, copy) NSString *subtitle;
@property (nonatomic, strong) NSString *destinationName;
@property (nonatomic, strong) UIImage *destinationImage;

- (instancetype)initWithDestinationIndex:
(NSUInteger)destinationIndex;
@end
