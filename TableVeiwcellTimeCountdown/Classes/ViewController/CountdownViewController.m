

//
//  CountdownViewController.m
//  TableVeiwcellTimeCountdown
//
//  Created by lujh on 2017/7/13.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "CountdownViewController.h"
#import "CountdownTableViewCell.h"
#import "TimeModel.h"

@interface CountdownViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CountdownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化变量
    [self initVariable];
    
    // 初始化导航栏
    [self setupNavigationBar];
    
    // 初始化定时器
    [self setupTimer];
    
    // 初始化TableView
    [self setupTableView];
    
}

#pragma mark -初始化变量

- (void)initVariable {

    self.timesArray = [NSArray array];
    
    self.timesArray = @[TIME_MODEL(@"第一个订单",@"1", 50),
                        TIME_MODEL(@"第二个订单",@"2", 31),
                        TIME_MODEL(@"第三个订单",@"3", 40),
                        TIME_MODEL(@"第四个订单", @"4",8089),
                        TIME_MODEL(@"第五个订单", @"5",394),
                        TIME_MODEL(@"第六个订单", @"6",10),
                        TIME_MODEL(@"第七个订单", @"7",233),
                        TIME_MODEL(@"第八个订单", @"8",4649),
                        TIME_MODEL(@"第九个订单", @"9",3454),
                        TIME_MODEL(@"第十个订单", @"10",20),
                        TIME_MODEL(@"第十一个订单", @"11",235),
                        TIME_MODEL(@"第十二个订单", @"12",235),
                        TIME_MODEL(@"第十三个订单", @"13",235),
                        TIME_MODEL(@"第十四个订单", @"14",235),
                        TIME_MODEL(@"第十五个订单", @"15",20),
                        TIME_MODEL(@"第十六个订单", @"16",235),
                        TIME_MODEL(@"第十七个订单", @"17",235),
                        TIME_MODEL(@"第十八个订单", @"18",394),
                        TIME_MODEL(@"第十九个订单", @"19",20),
                        TIME_MODEL(@"第二十个订单", @"20",233),
                        TIME_MODEL(@"第二十一个订单", @"21",4649),
                        TIME_MODEL(@"第二十二个订单", @"22",15),
                        TIME_MODEL(@"第二十三个订单", @"23",20)
                        ];
}

#pragma mark -初始化导航栏

- (void)setupNavigationBar {
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];
    
    self.title = @"TableVeiwcell订单倒计时";
    
}

#pragma mark -初始化定时器

- (void)setupTimer {
    
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark -初始化TableView

- (void)setupTableView {
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
}

- (void)timeChange {
    
    for (int count = 0; count < _timesArray.count; count++) {
        
        TimeModel *model = _timesArray[count];
    
        [model countDown];
        
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:CountDownTableViewCell object:nil];
}

#pragma mark - tableView代理

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.timesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CountdownTableViewCell *cell = [CountdownTableViewCell cellWithTableView:tableView];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.timesArray[indexPath.row];
    
    // 去支付按钮block
    cell.gotoPayBtnClickBlock = ^(UIButton *button) {
        
        NSLog(@"gotoPay");
    };
    
    return cell;
}

-(void)dealloc {

    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
