//
//  MovieDetailsViewController.h
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"


@interface MovieDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *posterImage;

@property (strong, nonatomic) IBOutlet UITextView *reviewText;
@property (strong, nonatomic) IBOutlet UIButton *showTheatresButton;


@property (strong, nonatomic) IBOutlet UITextView *synopsisText;

@property (nonatomic) Movie* movie;


-(void) getReviews;

@end
