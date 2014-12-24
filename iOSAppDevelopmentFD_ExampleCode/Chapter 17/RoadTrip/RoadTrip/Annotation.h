//
//  Annotation.h
//  RoadTrip
//
//  Created by Wiley Publishing on 2/8/14.
//  Copyright (c) 2014 Jesse Feiler. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Annotation : NSObject <MKAnnotation>

@property (nonatomic, readwrite)
CLLocationCoordinate2D coordinate;
@property (nonatomic, readwrite, copy) NSString *title;
@property (nonatomic, readwrite, copy) NSString *subtitle;

@end
