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

#define kCATransitionCube @"cube"                    //方块
#define kCATransitionSuckEffect @"suckEffect"        //三角
#define kCATransitionRippleEffect @"rippleEffect"    //水波抖动
#define kCATransitionPageCurl @"pageCurl"            //上翻页
#define kCATransitionPageUnCurl @"pageUnCurl"        //下翻页
#define kCATransitionOglFlip @"oglFlip"              //上下翻转
#define kCATransitionCameraIrisHollowOpen @"cameraIrisHollowOpen"    //镜头快门开
#define kCATransitionCameraIrisHollowClose @"cameraIrisHollowClose"  //镜头快门关


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
 
 这里默认是每帧的时间一样。timingFunction一样，碰到具体的需求可以另外设置，如下：
 rectRunAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0],
 [NSNumber numberWithFloat:0.6],
 [NSNumber numberWithFloat:0.7],
 [NSNumber numberWithFloat:0.8],
 [NSNumber numberWithFloat:1]];
 rectRunAnimation.timingFunctions = @[
 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
 （5）calculationMode属性
 1 const kCAAnimationLinear//线性，默认
 2 const kCAAnimationDiscrete//离散，无中间过程，但keyTimes设置的时间依旧生效，物体跳跃地出现在各个关键帧上
 3 const kCAAnimationPaced//平均，keyTimes跟timeFunctions失效
 4 const kCAAnimationCubic//平均，同上
 5 const kCAAnimationCubicPaced//平均，同上

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


/**
 动画组的封装

 @param view 动画视图
 @param propertys 每个property包含了一个动画的信息
  @param groupProperty 组动画的信息
 */
+(void) animationWithGrounpView:(UIView *) view propertys:(NSArray<HDAnimationModel *>  *)propertys groupProperty:(HDAnimationModel *) groupProperty;



/**
 弹性动画

 @param view 动画视图
 @param keyPath keypath
 @param property 动画的信息
 */
+(void) animationWithSpringView:(UIView *) view keyPath:(NSString *)keyPath property:(HDAnimationModel *)property;


/**
 转场动画
 @param view 动画视图
 @param type 动画类型
 @param property 动画的信息
 
 type的
 kCATransitionPush 推入效果
 kCATransitionMoveIn 移入效果
 kCATransitionReveal 截开效果
 kCATransitionFade 渐入渐出效果
 
 以下API效果可以安全使用
 cube 方块
 suckEffect 三角
 rippleEffect 水波抖动
 pageCurl 上翻页
 pageUnCurl 下翻页
 oglFlip 上下翻转
 cameraIrisHollowOpen 镜头快门开
 cameraIrisHollowClose 镜头快门开

 subType:
CA_EXTERN NSString * const kCATransitionFromRight
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionFromLeft
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionFromTop
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);
CA_EXTERN NSString * const kCATransitionFromBottom
CA_AVAILABLE_STARTING (10.5, 2.0, 9.0, 2.0);


 */
+(void) animationWithTransitionView:(UIView *) view type:(NSString *)type property:(HDAnimationModel *) property;


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
