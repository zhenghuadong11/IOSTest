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
#define Use_Id (56887554896)

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)#define Layout_375_x(x) ((x)/375.0 * Screen_Width/2)  //750px 图片
#define Layout_675_y(y) ((y)/675.0 * Screen_Height/2)  //1350px 图片
#define Rect_DEFAULT CGRectMake(x, y, width, height)



#define PIWithAngle(x) (x/180.0*M_PI_2 * 2)

#ifdef DEBUG
#define MYLog(...) NSLog(__VA_ARGS__)
#define MYLogMethod() NSLog(@"%s",__func__)
#else
#define MYLog(...)
#define MYLogMethod()
#endif

@interface HDDefault : NSObject

@end
