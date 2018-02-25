//
//  HDValite.h
//  修改核心类库
//
//  Created by 郑华栋 on 2018/2/9.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 用于数据的验证
 */
@interface HDValite : NSObject

/**
是否是手机号码

 @param mobile 手机号码
 @return 真假
 */
+(BOOL) isMobile:(NSString *) mobile;

/**
 是否是身份证号

 @param value 身份证号码
 @return 真假
 */
+(BOOL) isIDCardNumber:(NSString *)value;

/**
 是否是电子邮箱

 @param Email 邮箱
 @return 真假
 */
+(BOOL) IsEmailAdress:(NSString *)Email;

/**
 银行卡号码

 @param cardNumber 银行卡号码
 @return 真假
 */
+(BOOL) IsBankCard:(NSString *)cardNumber;

/**
 是否是整数

 @param string <#string description#>
 @return <#return value description#>
 */
+ (BOOL)isPureInt:(NSString*)string;

/**
 是否是浮点数

 @param string <#string description#>
 @return <#return value description#>
 */
+ (BOOL)isPureFloat:(NSString*)string;
@end
