//
//  CountdownViewController.h
//  TableVeiwcellTimeCountdown
//
//  Created by lujh on 2017/7/13.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountdownViewController : UIViewController

// tableView
@property (nonatomic, strong) UITableView *tableView;
// timer
@property (nonatomic, strong) NSTimer *timer;
// timesArray
@property (nonatomic, copy) NSArray *timesArray;

@end
