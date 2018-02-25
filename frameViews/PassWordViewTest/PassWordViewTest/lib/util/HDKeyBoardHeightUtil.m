//
//  HDKeyBoardHeightUtil.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDKeyBoardHeightUtil.h"

@implementation HDKeyBoardHeightUtil
-(instancetype)init{
    if (self = [super init]) {
        
        //增加监听，当键盘出现或改变时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification
                                                   object:nil];
        
        //增加监听，当键退出时收出消息
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification
                                                   object:nil];
        
    }
    return self;
}

//当键盘出现或改变时调用
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSLog(@"%@",userInfo);
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int height = keyboardRect.size.height;
    if ([self.delegate respondsToSelector:@selector(keyBoardHeightUtil:showHeight:)]) {
        [self.delegate keyBoardHeightUtil:self showHeight:height];
    }
    
}

//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification{
    if ([self.delegate respondsToSelector:@selector(keyBoardHeightUtilHidden:)]) {
        [self.delegate keyBoardHeightUtilHidden:self];
    }
    
}


@end
