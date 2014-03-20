//
//  MoviesViewController.h
//  rottentomatoes
//
//  Created by Tony Dao on 3/18/14.
//  Copyright (c) 2014 Tony Dao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBProgressHUD;

@interface MoviesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
 MBProgressHUD *HUD;
}
@end
