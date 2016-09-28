//
//  Theatre.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-27.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "Theatre.h"

@implementation Theatre

- (instancetype)initWithCoordinate:(CLLocationCoordinate2D)coordinate subtitle:(NSString *)subtitle andName:(NSString *)title
{
    self = [super init];
    if (self) {
        _coordinate = coordinate;
        _subtitle = subtitle;
        _title = title;
    }
    return self;
}

@end
