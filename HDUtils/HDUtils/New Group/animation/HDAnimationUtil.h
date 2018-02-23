//
//  HDAnimationUtil.h
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/22.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HDAnimationModel.h"
@interface HDAnimationUtil : NSObject

/**
 动画最简单的参数

 @param view 动画的view
 @param keyPath 动画的属性，一般是layer的属性都支持。具体查阅网站
 @param toValue 变成的值
 */
+(void) animationWithBaseView:(UIView *) view keyPath:(NSString *)keyPath toValue:(id)toValue;

/**
 复杂的动画

 @param view 动画的view
 @param keyPath  动画的属性，一般是layer的属性都支持。具体查阅网站
 @param property 动画属性的集合
 可以传key
 1、toValue。         //结束的值 （这个是必须有的）
 2、fromValue。      //开始的值
 3、duration        //每次动画持续时间
 4、repeatCount     //重复的次数
 5、timingFunction  //动画快慢等，先快后慢之类的
 6、beginTime。     //多少秒后开始
 7、isReset        //是否还原
 8、isReverse      //是否反转
 */
+(void) animationWithBaseView:(UIView *) view keyPath:(NSString *)keyPath property:(HDAnimationModel *)property;



/**
 点的帧动画

 @param view 动画的view
 @param keyPath  动画的属性，一般是layer的属性都支持。具体查阅网站
 @param values   点的集合
 @param property 动画属性的集合
 */
+(void) animationWithKeyFrameView:(UIView *) view keyPath:(NSString *)keyPath values:(NSArray *)values property:(HDAnimationModel *)property;;

/**
 path的帧动画

 @param view 动画的view
 @param keyPath 动画的属性，一般是layer的属性都支持。具体查阅网站
 @param path 路线
 @param property 动画属性的集合
 */
+(void) animationWithKeyFrameView:(UIView *) view keyPath:(NSString *)keyPath path:(CGPathRef)path property:(HDAnimationModel *)property;



/*
 常用keypath，一般来说都是layer的属性
 transform.scale = 比例轉換
 
 transform.scale.x = 宽的比例轉換
 
 transform.scale.y = 高的比例轉換
 
 transform.rotation.z = 平面圖的旋轉
 
 opacity = 透明度
 
 margin=边框间隔?
 
 zPosition = 平面图的位置
 
 backgroundColor = 背景色
 
 cornerRadius = layer的角度
 
 borderWidth = 边框宽度
 
 contents = 内容?
 
 bounds = 大小?
 
 contentsRect = 内容矩形
 
 frame = 位置
 
 hidden = 隐藏
 
 mask = 标记
 
 maskToBounds
 
 position = 位置
 
 shadowOffset = 阴影偏移?
 
 shadowColor = 阴影颜色
 
 shadowRadius = 阴影角度

 */
@end
