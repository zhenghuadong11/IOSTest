//
//  HDTextField.h
//  TextFileldDelegateTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDTextField;
@protocol HDTextFieldDelegate<NSObject>
@optional
- (void)hdTextFieldDeleteBackward:(HDTextField *)textField;
@optional
- (void)hdTextField:(HDTextField *)textField insertText:(NSString *)text;
@optional
- (void)hdTextFieldHasText:(HDTextField *)textField;
@end
/**
 这里主要增加一些额外的delegate
 */
@interface HDTextField : UITextField
@property(nonatomic,weak) id<HDTextFieldDelegate> hdDelegate;
@end
