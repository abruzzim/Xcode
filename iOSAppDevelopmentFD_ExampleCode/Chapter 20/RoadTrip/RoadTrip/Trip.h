//
//  Trip.h
//  RoadTrip
//
//  Created by Wiley Publishing on 2/4/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@class Annotation;

@interface Trip : NSObject
-(instancetype)initWithDestinationIndex:(int)destinationIndex;
- (UIImage *) destinationImage;
- (NSString *) destinationName;
- (CLLocationCoordinate2D) destinationCoordinate;
- (NSString *)weather;
- (NSUInteger)numberOfEvents;
- (NSString *)getEvent:(NSUInteger)index;
- (NSArray *)createAnnotations;
- (NSString *)mapTitle;
- (void)addLocation:(NSString *)findLocation
  completionHandler:
(void (^)(Annotation *annotation, NSError* error))
completion;
@end
