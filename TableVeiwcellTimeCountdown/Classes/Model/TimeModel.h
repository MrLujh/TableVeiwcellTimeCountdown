//
//  TimeModel.h
//  TableVeiwcellTimeCountdown
//
//  Created by lujh on 2017/7/13.
//  Copyright © 2017年 lujh. All rights reserved.
//

#define TIME_MODEL(title,image,time)  [TimeModel timeModelWithTitle:(title) Iimage:(image) CountdownTime:@(time)]

#import <Foundation/Foundation.h>


@interface TimeModel : NSObject

// image
@property (nonatomic, copy) NSString *image;
// title
@property (nonatomic, strong) NSString  *title;
// countdownTime
@property (nonatomic, strong) NSNumber  *countdownTime;

/**
 *  便利构造器
 *
 *  @param title         标题
 *  @param countdownTime 倒计时
 *
 *  @return 实例对象
 */
+ (instancetype)timeModelWithTitle:(NSString *)title Iimage:(NSString *)image CountdownTime:(NSNumber *)countdownTime;

/**
 *  计数减1(countdownTime - 1)
 */
- (void)countDown;

/**
 *  将当前的countdownTime信息转换成字符串
 */
- (NSString *)currentTimeString;

@end
