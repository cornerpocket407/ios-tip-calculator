//
//  MovieCell.m
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import "MovieCell.h"

@interface MovieCell()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@end

@implementation MovieCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Public methods
- (void)setMovie:(Movie *)movie {
    _movie  = movie;
    self.movieTitleLabel.text = movie.title;
    self.synopsisLabel.text = movie.synopsis;
    NSString *ImageURL = movie.thumbnailUrl;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
    self.posterView.image = [UIImage imageWithData:imageData];
}

@end
