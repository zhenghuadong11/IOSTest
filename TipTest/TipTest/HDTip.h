//
//  HDTip.h
//  TipTest
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HDTip : NSObject
/*
 *  功能：用户提示，需要用户点击才能取消，
 *  在最开始的vc没有加载完毕之前。弹框不会出现
 */
+(void) alertTipTitle:(NSString *) title message:(NSString *) message;

/*
 * ios 8以上直接用这个
 */
+(void) alertTipTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)  buttonNames actions:(NSDictionary<NSString *,void(^)(void)> *) actions;
/*
 *  需要支持 ios7及以下的用这个，超级无敌麻烦,这个弃用了，真是麻烦，只支持iOS 8
 *
 */
+(void) alertTipTitle:(NSString *)title message:(NSString *)message actions:(NSDictionary<NSString *,void(^)(void)> *) actions buttons:(NSString *) buttonNames, ...NS_REQUIRES_NIL_TERMINATION;
+(void) alertTipTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)  buttonNames actions:(NSDictionary<NSString *,void(^)(void)> *) actions fieldItems:(NSArray<NSNumber *> *) fieldItems;
+(void) test;
@end
