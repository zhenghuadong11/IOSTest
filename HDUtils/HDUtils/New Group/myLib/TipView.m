//
//  TipView.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/3/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "TipView.h"
#import "HDTip.h"
@implementation TipView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.block != nil) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.block();
        });
    }
}

@end
