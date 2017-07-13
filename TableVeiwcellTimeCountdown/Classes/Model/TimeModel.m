

//
//  TimeModel.m
//  TableVeiwcellTimeCountdown
//
//  Created by lujh on 2017/7/13.
//  Copyright © 2017年 lujh. All rights reserved.
//

#import "TimeModel.h"

@implementation TimeModel

+ (instancetype)timeModelWithTitle:(NSString *)title Iimage:(NSString *)image CountdownTime:(NSNumber *)countdownTime {
    
    TimeModel *model = [[[self class] alloc] init];
    
    model.title         = title;
    model.countdownTime = countdownTime;
    model.image = image;
    return model;
}

- (void)countDown {
    
    _countdownTime = @(_countdownTime.integerValue - 1);
}

- (NSString *)currentTimeString {
    
    NSInteger seconds = _countdownTime.integerValue;
    
    if (seconds <= 0) {
        
        return @"0";
        
    } else {
        
        return [NSString stringWithFormat:@"%02ld:%02ld:%02ld",
                (long)(seconds / 3600), (long)(seconds % 3600 / 60), (long)(seconds  % 60)];
    }
}

@end
