//
//  Annotation.h
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-30.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Annotation : MKAnnotationView {
    
    NSString *_title;
    NSString *_subtitle;
    
    CLLocationCoordinate2D _coordinate;
}

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

- (id)initWithLocation:(CLLocationCoordinate2D)coord;

- (void)addPinWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coord;


- (void)setTitle:(NSString *)title;

- (void)setSubtitle:(NSString *)subtitle;

@end
