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
#import "Theatre.h"
#import "Annotation.h"

static const int zoominMapArea = 200;
static NSString * const LLTHEATER_API_ENDPOINT = @"http://lighthouse-movie-showtimes.herokuapp.com/theatres.json?";


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

-(void)locationManager:(CLLocationManager *)locManager didUpdateLocations:(nonnull NSArray<CLLocation *> *)locations {
    NSLog(@"%@ THESE ARE LOCATIONS", locations);
    
    [self.locationManager stopUpdatingLocation];
    
    
    //store location into a variable
    
    CLLocation *aLocation = [locations lastObject];
    
    
    //zoom
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.005, 0.005);
    
    
    //zoom into coordinates
    MKCoordinateRegion region = MKCoordinateRegionMake(aLocation.coordinate, span);
    [self.mapView setRegion:region animated:YES];
    
    //create a geocoder --- converts geocode to a human readable address
    CLGeocoder *coder= [[CLGeocoder alloc] init];
    [coder reverseGeocodeLocation:aLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = [placemarks lastObject];
        NSLog(@"Here : %@", [placemark country]);
        
       ///place this code into a class method next time
        
        NSString * fullURL = [NSString stringWithFormat:@"address=%@&movie=%@",[placemark postalCode], self.movie.movieName];
        NSString *newString = [LLTHEATER_API_ENDPOINT stringByAppendingString:fullURL];
        newString = [newString stringByAddingPercentEncodingWithAllowedCharacters: [NSCharacterSet URLQueryAllowedCharacterSet]];
        
        NSLog(@"NEW STRING %@", newString);
        
        NSURL *theURL = [NSURL URLWithString:newString];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithURL:theURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSDictionary *locsDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];

            
            NSLog(@"%@", locsDictionary);
            
            for (Theatre* theatres in locsDictionary) {
                MKPinAnnotationView* pinView = (MKPinAnnotationView*)
                [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"CustomPinAnnotationView"];
            }
        }];
        
        [dataTask resume];
    }
     
     
     
     ];}





@end
