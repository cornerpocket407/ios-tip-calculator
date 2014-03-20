//
//  MoviesViewController.m
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import "MoviesViewController.h"
#import "MovieViewController.h"
#import "Movie.h"
#import "MovieCell.h"
#import "AFHTTPRequestOperationManager.h"
#import "MBProgressHUD.h"

@interface MoviesViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *movies;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
- (void)reload;
@end

@implementation MoviesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self reload];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.errorLabel.hidden = YES;
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    [HUD show:YES];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 150;
    UINib *movieCellNib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.tableView registerNib:movieCellNib forCellReuseIdentifier:@"MovieCell"];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell" forIndexPath:indexPath];
    cell.movie = self.movies[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Movie *movie = self.movies[indexPath.row];
    MovieViewController *mc = [MovieViewController alloc];
    mc.movie = movie;
    [mc init];
    [self.navigationController pushViewController:mc animated:YES];
}

- (void)refresh:(UIRefreshControl *)refreshControl {
    [self reload];
    [refreshControl endRefreshing];
}

#pragma mark - Private methods

- (void)reload {
    NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        self.movies = [Movie moviesWithArray:responseObject[@"movies"]];
        [self.tableView reloadData];
        [HUD hide:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        self.tableView.hidden = YES;
        self.errorLabel.hidden = NO;
        NSLog(@"Error: %@", error);
        [HUD hide:YES];
    }];
}

@end
