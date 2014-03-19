//
//  Movie.m
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import "Movie.h"

@implementation Movie
- (id) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = dictionary[@"title"];;
        self.synopsis = dictionary[@"synopsis"];
        self.thumbnailUrl = dictionary[@"posters"][@"thumbnail"];
        self.movieId = dictionary[@"id"];
        self.originalImageUrl = dictionary[@"posters"][@"original"];
    }
    return self;
}
+ (NSArray *)moviesWithArray:(NSArray *)array {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Movie *movie = [[Movie alloc] initWithDictionary:dictionary];
        [movies addObject:movie];
    }
    return movies;
}
+ (id) init:(NSDictionary *)dictionary {
    Movie *movie = [[Movie alloc] init];
    movie.title = dictionary[@"title"];
    movie.synopsis = dictionary[@"synopsis"];
    movie.thumbnailUrl = dictionary[@"posters"][@"thumbnail"];
    movie.movieId = dictionary[@"id"];
    return movie;
}
@end
