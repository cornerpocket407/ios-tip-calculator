//
//  Movie.h
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property(nonatomic, strong) NSString *movieId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *cast;
@property (nonatomic, strong) NSString *thumbnailUrl;
@property (nonatomic, strong) NSString *originalImageUrl;
@property (nonatomic, strong) NSMutableArray *casts;
- (id) initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray:(NSArray *)array;
+ (id) init:(NSDictionary *)dictionary;
@end
