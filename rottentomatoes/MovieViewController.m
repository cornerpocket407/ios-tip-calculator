//
//  MovieViewController.m
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import "MovieViewController.h"
#import "Movie.h"
#import "AFHTTPRequestOperationManager.h"
#import "MBProgressHUD.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface MovieViewController ()
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movieImage;
@property (weak, nonatomic) IBOutlet UILabel *castLabel;
@property (weak, nonatomic) IBOutlet UILabel *namesLabel;

@end

@implementation MovieViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString *url = [NSString stringWithFormat:@"http://api.rottentomatoes.com/api/public/v1.0/movies/%@/cast.json?apikey=g9au4hv6khv6wzvzgt55gpqs",_movie.movieId];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            _movie.casts = [[NSMutableArray alloc] init];
            for (NSDictionary *dictionary in responseObject[@"cast"]) {
                [_movie.casts addObject:dictionary[@"name"]];
            }
            [self reload];
            [HUD hide:YES];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
            [HUD hide:YES];
        }];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [HUD show:YES];
    [self reload];
}

- (void)reload {
    self.synopsisLabel.text = _movie.synopsis;
    [self.movieImage setImageWithURL:[NSURL URLWithString:_movie.originalImageUrl]];
    self.namesLabel.text = [_movie.casts componentsJoinedByString:@", "];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
