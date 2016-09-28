//
//  Theatre.h
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-27.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@import CoreLocation;


//The MKAnnotation protocol is used to provide annotation-related information to a map view.

@interface Theatre : NSObject <MKAnnotation>


@property (nonatomic, readonly, copy) NSString* title;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly, copy) NSString* subtitle;


-(instancetype) initWithCoordinate:(CLLocationCoordinate2D)coordinate subtitle:(NSString *)subtitle andName:(NSString *)title;

@end
