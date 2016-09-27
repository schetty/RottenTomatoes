//
//  MovieDetailsViewController.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "MovieDetailsViewController.h"
#import "Movie.h"

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

}
-(void) setMovie:(Movie *)movie{
    
    _movie = movie;
}

@end
