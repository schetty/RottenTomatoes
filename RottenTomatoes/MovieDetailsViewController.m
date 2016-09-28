//
//  MovieDetailsViewController.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "Movie.h"

//set constant for api json



@interface MovieDetailsViewController ()



@end

@implementation MovieDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL* url = [NSURL URLWithString:self.movie.imageStr];
    
    NSURLSession * session = [NSURLSession sharedSession];
    [[session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData* getData = [NSData dataWithContentsOfURL:location];
        UIImage *downloadedImage = [UIImage imageWithData:getData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.posterImage.image = downloadedImage;
        });
        
    }] resume];
    
    
    [self getReviews];

    
}


-(void) setMovie:(Movie *)movie{
    
    _movie = movie;
}

-(void) getReviews {
    NSURL* reviewsURL = [NSURL URLWithString:self.movie.movieReviews];
    NSURLSession *downloadReviews = [NSURLSession sharedSession];
    //strings get data task
    [[downloadReviews dataTaskWithURL:reviewsURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *wholeDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
        NSDictionary *reviewsDict = [wholeDictionary objectForKey:@"reviews"];
        
        NSMutableString *listedReviews = [[NSMutableString alloc] init];
        for (NSDictionary * dict in reviewsDict) {
            NSString * critic = [dict objectForKey:@"ctitic"];
            NSString* publication = [dict objectForKey:@"publication"];
            NSString* impression = [dict objectForKey:@"freshness"];
            NSString* quote = [dict objectForKey:@"quote"];
            NSString* review = [NSString stringWithFormat:@"%@\nwriting for - %@\n%@\n%@\n\n",critic, publication,impression, quote];
            [listedReviews appendString:review];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.reviewText.text = listedReviews;
        });
        
        
    }]resume];
}

@end
