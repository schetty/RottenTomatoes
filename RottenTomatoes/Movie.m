//
//  Movie.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithInfo:(NSDictionary *)info
{
    self = [super init];
    if (self) {
        _movieName = info[@"title"];
        _releaseDate = info[@"release_dates"];
//        [self isInTheatres];
        _imageStr = info[@"posters"][@"original"];
        _movieSynopsis = info[@"synopsis"];
        _movieReviews = info[@"links"][@"reviews"];
        NSLog(@" HELLO %@", info);
        
    }
    return self;
}

-(BOOL)isInTheatres{
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSCalendarUnitMonth
                                       fromDate:self.releaseDate
                                       toDate:now
                                       options:0];
    NSInteger age = [ageComponents month];
    if (age < 2) {
        
        return true;
    }
    
    return false;
}


@end
