//
//  CountdownTableViewCell.h
//  TableVeiwcellTimeCountdown
//
//  Created by lujh on 2017/7/13.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimeModel.h"

typedef void (^ButtonClickBlock) (UIButton *button);

@interface CountdownTableViewCell : UITableViewCell
// backView
@property (nonatomic, strong) UIView *backView;
// titleLabel
@property (nonatomic, strong) UILabel *titleLabel;
// countdownLabel
@property (nonatomic, strong) UILabel  *countdownLabel;
// gotoPayBtn
@property (nonatomic, strong) UIButton *gotoPayBtn;
// model
@property (nonatomic, strong) TimeModel *model;
// imageview
@property (nonatomic, strong) UIImageView *imageview;
// gotoPayBtnClickBlock
@property (nonatomic, copy) ButtonClickBlock gotoPayBtnClickBlock;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
