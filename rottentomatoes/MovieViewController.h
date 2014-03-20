//
//  MovieViewController.h
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Movie.h"

@class MBProgressHUD;

@interface MovieViewController : UIViewController {
 MBProgressHUD *HUD;
}
@property (strong, nonatomic) Movie *movie;
@end
