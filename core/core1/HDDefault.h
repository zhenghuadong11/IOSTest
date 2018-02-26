//
//  THDefault.h
//  BigHTML5
//
//  Created by apple on 17/8/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+RGB.h"
#import "UIFont+PxToSize.h"
#import "UIView+FRAME_SET.h"


#define LESS_VERSION(version) ([[UIDevice currentDevice].systemVersion floatValue] < version)

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)
#define Layout_375_x(x) ((x)/375.0 * SCREEN_W/2)  //750px 图片
#define Layout_675_y(y) ((y)/675.0 * SCREEN_H/2)  //1350px 图片
#define Rect_DEFAULT CGRectMake(x, y, width, height)

/**
 生成弱引用
 @param self self
 @return 弱引用
 */
#define WEAK_SELFINIT typeof(self) weakSelf = self

#define PIWithAngle(x) (x/180.0*M_PI_2 * 2)

#ifdef DEBUG
#define HDLog(...) NSLog(__VA_ARGS__)
#define HDLogMethod() NSLog(@"%s",__func__)
#else
#define HDLog(...)
#define HDLogMethod()
#endif

@interface HDDefault : NSObject

@end

