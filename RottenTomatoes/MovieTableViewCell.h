//
//  MovieTableViewCell.h
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@interface MovieTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *posterImageView;

@property (strong, nonatomic) Movie *movie;

@end
