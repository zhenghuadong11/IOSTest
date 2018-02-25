//
//  HDTextField.m
//  TextFileldDelegateTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDTextField.h"

@implementation HDTextField

- (void)deleteBackward {
    //    ！！！这里要调用super方法，要不然删不了东西
    [super deleteBackward];
    
    if ([self.hdDelegate respondsToSelector:@selector(hdTextFieldDeleteBackward:)]) {
        [self.hdDelegate hdTextFieldDeleteBackward:self];
    }
}
-(void)insertText:(NSString *)text{
    [super insertText:text];
    if ([self.hdDelegate respondsToSelector:@selector(hdTextField:insertText:)]) {
        [self.hdDelegate hdTextField:self insertText:text];
    }
}
-(BOOL)hasText{
    BOOL result = [super hasText];
    if (result ==true) {
        if ([self.hdDelegate respondsToSelector:@selector(hdTextFieldHasText:)]) {
            [self.hdDelegate hdTextFieldHasText:self];
        }
    }
    return result;
}
@end
