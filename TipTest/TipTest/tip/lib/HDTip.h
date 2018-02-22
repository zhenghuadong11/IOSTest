//
//  HDTip.h
//  TipTest
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"


@interface HDTip : NSObject

@property(nonatomic,strong) MBProgressHUD * progressHUD;

@property(nonatomic,copy) NSString * detailText;
@property(nonatomic,assign) CGFloat progress;
#pragma mark --  提示用户，不会自动取消
/*
 *  功能：用户提示，需要用户点击才能取消，
 *  在最开始的vc没有加载完毕之前。弹框不会出现
 */
+(void) alertTipTitle:(NSString *) title message:(NSString *) message;

/*
 * ios 8以上直接用这个
 */
+(void) alertTipTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)  buttonNames actions:(NSDictionary<NSString *,void(^)(void)> *) actions;


#pragma mark --  提示用户，2秒后消失
+(void) tipHiddenWithText:(NSString *) text;

#pragma mark --  提示正在加载中
-(void) tipHUDWithText:(NSString *) text;

/**
 使用detailText来显示百分之几

 @param text 加载提示
 @param detailText 加载百分比
 */
-(void) tipHUDWithText:(NSString *)text detailText:(NSString *)detailText;
-(void) tipHUDHidden;
/*
 *  利用圆形来显示加载百分比
 */
-(void) tipHUDCircle:(NSString *) text;


+(void) test;
@end
