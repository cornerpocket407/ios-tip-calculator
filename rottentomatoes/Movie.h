//
//  Movie.h
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *cast;
@property (nonatomic, strong) NSString *thumbnailUrl;
- (id) initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray:(NSArray *)array;
@end
