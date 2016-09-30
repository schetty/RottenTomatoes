//
//  MovieDetailsViewController.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "Movie.h"
#import "MapView.h"

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
    
    self.synopsisText.text = self.movie.movieSynopsis;
    
    [self getReviews];

    
}


-(void) setMovie:(Movie *)movie{
    
    _movie = movie;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showMap"]) {
      MapView *destinationViewController = (MapView *) segue.destinationViewController;
        ///pass objects not properties
        //pass box not donuts
        destinationViewController.movie = self.movie;
    }
}

-(void) getReviews {
    NSString *apiURL = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/movies/%@/reviews.json?apikey=c9zzxwtuc3q2tftqata3k59w", self.movie.movieID];
    NSURL* reviewsURL = [NSURL URLWithString:apiURL];
    NSURLSession *downloadReviews = [NSURLSession sharedSession];
    //strings get data task
    [[downloadReviews dataTaskWithURL:reviewsURL completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *wholeDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error: &error];
        NSDictionary *reviewsDict = [wholeDictionary objectForKey:@"reviews"];
        
        NSMutableString *listedReviews = [[NSMutableString alloc] init];
        for (NSDictionary * dict in reviewsDict) {
            NSString * critic = [dict objectForKey:@"critic"];
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
