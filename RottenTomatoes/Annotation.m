//
//  Annotation.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-30.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

- (id)initWithLocation:(CLLocationCoordinate2D)coord {
    self = [super init];
    if (self) {
        _coordinate = coord;
    }
    return self;
}


- (void)addPinWithTitle:(NSString *)title andCoordinate:(CLLocationCoordinate2D)coord {
    static NSString *reuseId = @"standardPin";
    MKAnnotationView *aView = (MKAnnotationView *)[sender
                                                   dequeueReusableAnnotationViewWithIdentifier:reuseId];
}


- (void)setTitle:(NSString *)title {
    
}

- (void)setSubtitle:(NSString *)subtitle {
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
