//
//  HDAnimationUtil.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/22.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDAnimationUtil.h"

@implementation HDAnimationUtil
+(void) animationWithBaseView:(UIView *) view keyPath:(NSString *)keyPath toValue:(id)toValue{
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:keyPath];
    ani.toValue = toValue;
    [view.layer addAnimation:ani forKey:nil];
}
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
 @property(getter=isAdditive) BOOL additive;
 


@property(getter=isCumulative) BOOL cumulative;
 */
+(void)animationWithBaseView:(UIView *)view keyPath:(NSString *)keyPath property:(HDAnimationModel *)property{
    CABasicAnimation * ani = [CABasicAnimation animationWithKeyPath:keyPath];
    if (property == nil || property.toValue == nil) {
        //toValue都没有就不进行动画了
        return;
    }
    ani.toValue = property.toValue;
    if (property.fromValue != nil) {
        ani.fromValue = property.fromValue;
    }

    [self setAnimation:ani property:property];
//     ani.fillMode = kCAFillModeBackwards;
//    ani.cumulative = true;  这个属性会在原本的基础上变化
//    ani.additive = true;    这个属性会在结束的基础上变化
    [view.layer addAnimation:ani forKey:nil];
}
+(void)animationWithKeyFrameView:(UIView *)view keyPath:(NSString *)keyPath values:(NSArray *)values property:(HDAnimationModel *)property{
    CAKeyframeAnimation * keyAni = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    keyAni.values = values;
    [self setAnimation:keyAni property:property];
    
    [view.layer addAnimation:keyAni forKey:nil];
}
+(void)animationWithKeyFrameView:(UIView *)view keyPath:(NSString *)keyPath path:(CGPathRef)path property:(HDAnimationModel *)property{
    CAKeyframeAnimation * keyAni = [CAKeyframeAnimation animationWithKeyPath:keyPath];
    
    keyAni.path = path;
    [self setAnimation:keyAni property:property];
    
    [view.layer addAnimation:keyAni forKey:nil];
}
+(void) setAnimation:(CAAnimation *) ani property:(HDAnimationModel *) property{
    if (property == nil) {
        return;
    }
    if (property.duration != 0) {
        ani.duration = property.duration;
    }
    if (property.repeatCount != 0) {
        ani.repeatCount = property.repeatCount;
    }
    if (property.timingFunction != nil) {
        ani.timingFunction = property.timingFunction;
    }
    if (property.beginTime != 0) {
        ani.beginTime = property.beginTime;
    }
    if (property.isNotReset == true) {
        ani.removedOnCompletion = NO;
        ani.fillMode = kCAFillModeForwards;
    }
    if (property.isReverse == true) {
        ani.autoreverses = property.isReverse;
    }
}
@end
