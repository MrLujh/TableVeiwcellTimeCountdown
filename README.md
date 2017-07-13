# TableVeiwcellTimeCountdown
订单倒计时----完全解决了cell复用的问题 ，订单时间混乱
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
