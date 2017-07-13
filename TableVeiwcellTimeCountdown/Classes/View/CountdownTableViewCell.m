//
//  CountdownTableViewCell.m
//  TableVeiwcellTimeCountdown
//
//  Created by lujh on 2017/7/13.
//  Copyright © 2017年 lujh. All rights reserved.
//
#define leftAndRightPading  15
#import "CountdownTableViewCell.h"

@implementation CountdownTableViewCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"CountdownTableViewCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    
    return cell;
}

// 注意：cell是用initWithStyle初始化

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 初始化Subviews
        [self setupSubviews];
        
        self.backgroundColor = [UIColor clearColor];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationCenterEvent:)
                                                     name:CountDownTableViewCell
                                                   object:nil];
    }
    
    return self;
    
}

#pragma mark -初始化Subviews

- (void)setupSubviews {
    
    // backView
    self.backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 199)];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.backView];
    
    // imageview
    CGFloat W = SCREEN_WIDTH -2*leftAndRightPading;
    self.imageview = [[UIImageView alloc] init];
    self.imageview.frame = CGRectMake(leftAndRightPading, leftAndRightPading,W*0.6 , self.backView.height -2*leftAndRightPading);
    self.imageview.layer.cornerRadius = 10;
    self.imageview.layer.masksToBounds = YES;
    [self.backView addSubview:self.imageview];
    
    // titleLabel
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.imageview.right+15, self.imageview.top, W*0.4 -15, 40)];
    self.titleLabel.textColor = [UIColor grayColor];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.backgroundColor = [UIColor orangeColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.layer.borderWidth = 2;
    self.titleLabel.layer.borderColor = [UIColor greenColor].CGColor;
    self.titleLabel.layer.cornerRadius = 5;
    self.titleLabel.layer.masksToBounds = YES;
    [self.backView addSubview:self.titleLabel];

    // gotoPayBtn
    self.gotoPayBtn = [[UIButton alloc] init];
    self.gotoPayBtn.frame = CGRectMake(self.titleLabel.left, CGRectGetMidY(self.imageview.frame) -self.titleLabel.height/2.0, self.titleLabel.width, self.titleLabel.height);
    [self.gotoPayBtn setTitle:@"去支付" forState:UIControlStateNormal];
    [self.gotoPayBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.gotoPayBtn.backgroundColor = [UIColor whiteColor];
    self.gotoPayBtn.layer.borderWidth = 2;
    self.gotoPayBtn.layer.borderColor = [UIColor redColor].CGColor;
    self.gotoPayBtn.layer.cornerRadius = 5;
    self.gotoPayBtn.layer.masksToBounds = YES;
    [self.gotoPayBtn addTarget:self action:@selector(gotoPayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:self.gotoPayBtn];
    
    // countdownLabel
    self.countdownLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.left, self.imageview.bottom -self.titleLabel.height, self.titleLabel.width, self.titleLabel.height)];
    self.countdownLabel.textColor = [UIColor redColor];
    self.countdownLabel.textAlignment = NSTextAlignmentRight;
    self.countdownLabel.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:25.f];
    self.countdownLabel.layer.borderWidth = 2;
    self.countdownLabel.layer.borderColor = [UIColor greenColor].CGColor;
    self.countdownLabel.layer.cornerRadius = 5;
    self.countdownLabel.layer.masksToBounds = YES;
    self.countdownLabel.textAlignment = NSTextAlignmentCenter;
    [self.backView addSubview:self.countdownLabel];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, self.backView.bottom, SCREEN_WIDTH, 1);
    lineView.backgroundColor = [UIColor grayColor];
    lineView.alpha = 0.6;
    [self.contentView addSubview:lineView];
}

- (void)setModel:(TimeModel *)model {
    
    _model = model;
    
    self.imageview.image = [UIImage imageNamed:model.image];
    
    self.titleLabel.text = model.title;
    
    self.countdownLabel.text = [model currentTimeString];
    
    
    if ([[model currentTimeString] isEqualToString:@"0"]) {
    
        self.gotoPayBtn.hidden = YES;
        
        self.countdownLabel.text = @"订单已关闭";
        
    }else {
        
        self.gotoPayBtn.hidden = NO;
    }
    
}

- (void)notificationCenterEvent:(id)sender {
    
    self.countdownLabel.text = [_model currentTimeString];
    
    if ([[_model currentTimeString] isEqualToString:@"0"]) {
        
        self.countdownLabel.text = @"订单已关闭";
        
        self.gotoPayBtn.hidden = YES;
    }
}

#pragma mark -去支付按钮点击事件

- (void)gotoPayBtnClick:(UIButton*)btn {

    if (self.gotoPayBtnClickBlock != nil) {
        
        self.gotoPayBtnClickBlock(btn);
    }
}

-(void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
