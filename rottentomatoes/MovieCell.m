//
//  MovieCell.m
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import "MovieCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieCell()
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@end

@implementation MovieCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - Public methods
- (void)setMovie:(Movie *)movie {
    _movie  = movie;
    self.movieTitleLabel.text = movie.title;
    self.synopsisLabel.text = movie.synopsis;
    [self.posterView setImageWithURL:[NSURL URLWithString:movie.thumbnailUrl]];
}

@end
