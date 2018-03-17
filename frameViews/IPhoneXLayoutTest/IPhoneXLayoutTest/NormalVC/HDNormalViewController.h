//
//  HDNormalViewController.h
//  IPhoneXLayoutTest
//
//  Created by 郑华栋 on 2018/3/13.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDNormalViewController : UIViewController


/**
 安全区的视图，添加到这里的视图不会受到异性屏的影响，有时候竖屏有下巴也挺好看的，看情况吧
 */
@property(nonatomic,strong) UIView * safeContentView;


/**
 通过状态栏颜色做为iphoneX的状态栏背景（比背景颜色优先级高）
 @param color 颜色
 */
- (void)setStatusBarBackgroundColor:(UIColor *)color;

/**
 通过vc的背景颜色做为iphoneX的状态栏颜色和下巴的颜色
 @param color 颜色
 */
- (void)setBackGroundColorForLiuhai:(UIColor *) color;

/**
 通过背景图片做为iphoneX的状态栏和下巴背景
 @param image 图片
 */
- (void) setBackGroundImage:(UIImage *) image;
- (void) setFrameOrLayout;
@end
