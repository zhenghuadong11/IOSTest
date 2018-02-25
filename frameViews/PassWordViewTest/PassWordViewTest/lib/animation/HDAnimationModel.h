//
//  HDAnimationModel.h
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/22.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/**
 复杂的动画
 
 可以传key
 1、toValue。         //结束的值 （这个是必须有的）
 2、fromValue。      //开始的值
 3、duration        //每次动画持续时间
 4、repeatCount     //重复的次数
 5、timingFunction  //动画快慢等，先快后慢之类的
 6、beginTime。     //多少秒后开始
 7、isNotReset        //是否不还原
 8、isReverse          //是否反转
 */
@interface HDAnimationModel : NSObject

@property(nonatomic,strong) id toValue;
@property(nonatomic,strong) id fromValue;
@property(nonatomic,assign) CGFloat duration;
@property(nonatomic,assign) NSInteger repeatCount;
@property(nonatomic,strong) CAMediaTimingFunction * timingFunction;
@property(nonatomic,assign) CGFloat beginTime;
@property(nonatomic,assign) BOOL isNotReset;
@property(nonatomic,assign) BOOL isReverse;

@property(nonatomic,assign) BOOL isCumulative;  //这个属性会在原本的基础上变化
@property(nonatomic,assign) BOOL isAdditive;   //这个属性会在结束的基础上变化

//     ani.fillMode = kCAFillModeBackwards;

/*
 *   用于base和帧动画
 */
@property(nonatomic,copy) NSString * keyPath;
/**
   面向帧动画的,这两个设置了其中一个，默认是帧动画
 */
@property(nonatomic,copy) NSArray * values;
@property(nonatomic,assign)  CGPathRef path;

/**
 spring弹性动画,ios 9之后才能支持
 */
@property(nonatomic,assign) BOOL isSpring;
//质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
@property(nonatomic,assign) CGFloat mass;
//刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
@property(nonatomic,assign) CGFloat stiffness;
@property(nonatomic,assign) CGFloat damping;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
//初始速率，动画视图的初始速度大小;速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
@property(nonatomic,assign) CGFloat initialVelocity;
/**
 transition转场动画
 */
@property float startProgress;
@property float endProgress;
@property(nullable, copy) NSString *subtype;
@end
