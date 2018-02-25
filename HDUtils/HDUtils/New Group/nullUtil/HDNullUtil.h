//
//  HDNullUtil.h
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/5.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDNullUtil : NSObject


/**
 判断是否对象为空,tips的数量，应该和object的一致，或者以nsNUll结尾

 @param objects 需要判断的对象的数组
 @param tips 为空时对应的提示
 @param isStrict 是否严格判断，主要针对字符串的nil和@“”
 @return 返回数组是否存在空对象
 */
// - (void)list:(NSString *)string,...{
+(BOOL) checkNulltips:(NSArray<NSString *> *) tips isStrict:(BOOL) isStrict objects:(NSObject *) object,...;

+(void) defaultValue:(NSArray<NSObject *> *) defaultValues isStrict:(BOOL) isStrict objects:(NSObject *) object,...;

+(void) defaultValue:(NSObject *) defaultValue isStrict:(BOOL) isStrict object:(NSObject *) object;

/**
 获取空的数量，需要以【nsnull null】对象结尾。不太好用

 @param isStrict <#isStrict description#>
 @param object <#object description#>
 @return <#return value description#>
 */
+(NSInteger) numOfNullObjectIsStrict:(BOOL) isStrict objects:(NSObject *) object,...;
@end
