//
//  MovieDetailsViewController.h
//  RottenTomatoes
//
//  Created by naomi schettini on 2016-09-26.
//  Copyright © 2016 naomi schettini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieDetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *posterImage;

@property (strong, nonatomic) IBOutlet UITextView *reviewText;

@end
