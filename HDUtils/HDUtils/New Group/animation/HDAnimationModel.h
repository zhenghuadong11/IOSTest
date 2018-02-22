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
@end
