//
//  ClickButton.m
//  ClickTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ClickButton.h"

@implementation ClickButton

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [super touchesEnded:touches withEvent:event];
    NSLog(@"touchEnd");
}

@end
