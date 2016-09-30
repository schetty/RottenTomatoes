//
//  MapView.h
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-27.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
@import CoreLocation;
@import MapKit;
#import "Movie.h"

@interface MapView : UIViewController
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) Movie * movie;

@end
