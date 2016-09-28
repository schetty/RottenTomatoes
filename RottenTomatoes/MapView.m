//
//  MapView.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-27.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "MapView.h"
#import "LocationManager.h"
#import "AppDelegate.h"

#define zoominMapArea 2000
NSString * const LLTHEATER_API_ENDPOINT = @"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json";


@interface MapView () <MKMapViewDelegate, SharedLocationDelegate>

//@property LocationManager* locationManager;
@property (nonatomic) CLLocationManager* locationManager;
@property BOOL isSetUp;
@property NSArray *theatresArray;


@end

@implementation MapView

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    LocationManager *locationManager = [[LocationManager alloc] init];
//    locationManager.geocoder = [[CLGeocoder alloc] init];
    _locationManager = [CLLocationManager new];
    [_locationManager requestWhenInUseAuthorization];
    [_locationManager startUpdatingLocation];
    self.isSetUp = NO;
  
//    self.locationManager = [LocationManager sharedManager];
    _locationManager.delegate = self;
//    [self.locationManager startLocationMonitoring];
    
    self.mapView.showsUserLocation = YES;
    self.mapView.delegate = self;
    
    
}

//
//-(void) passCurrentLocation:(CLLocation*) currentLocation {
//    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake(currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
//    
//    MKCoordinateRegion adjustedRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, zoominMapArea, zoominMapArea);
//    
//    [_mapView setRegion:adjustedRegion animated:YES];
//    
//    
//    [FoursquareManager responseFrom4sq:currentLocation categoryId:@"4d4b7105d754a06377d81259" limit:@"10" block:^(NSArray *locationsArray, NSError *error) {
//    
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [_mapView addAnnotations:locationsArray];
//        });
//        
//    }];
//}




@end
