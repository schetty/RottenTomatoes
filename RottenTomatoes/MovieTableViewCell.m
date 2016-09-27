//
//  MovieTableViewCell.m
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

-(void)setMovie:(Movie *)movie {
    _movie = movie;
    
    NSURL* url = [NSURL URLWithString:movie.imageStr];
    
    NSURLSession * session = [NSURLSession sharedSession];
    [[session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        NSData* getData = [NSData dataWithContentsOfURL:location];
        UIImage *downloadedImage = [UIImage imageWithData:getData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.posterImageView.image = downloadedImage;
        });
        
    }] resume];
    
    self.titleLabel.text = movie.movieName;
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
