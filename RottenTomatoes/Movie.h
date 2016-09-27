//
//  Movie.h
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Movie : NSObject

@property NSString * movieName;
@property NSDate * releaseDate;
@property NSString *imageStr;
@property NSString *movieSynopsis;
@property NSString *movieReviews;




//@property NSDictionary * info;

- (instancetype) initWithInfo: (NSDictionary *) info;

- (BOOL)isInTheatres;


@end
