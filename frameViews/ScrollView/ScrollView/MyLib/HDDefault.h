//
//  THDefault.h
//  BigHTML5
//
//  Created by apple on 17/8/23.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#define LESS_VERSION(version) ([[UIDevice currentDevice].systemVersion floatValue] < version)
#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)



#import "UIView+FRAME_SET.h"
#import "UIColor+RGB.h"



#define None_Test @"－－"
#define Use_Id (56887554896)
#define Light_Blue_Color ([UIColor colorWithHexString:@"#5ac8fa"])
#define YiChang_Color [UIColor colorWithHexString:@"#ff9a66"]
#define Blue_Color ([UIColor colorWithHexString:@"#6699ff"])
#define CGLayoutRect(x,y,width,height) (CGRectMake(Layout_375_x(x), Layout_675_y(y), Layout_375_x(width), Layout_675_y(height)))
#define Screen_Width ([[UIScreen mainScreen] bounds].size.width)
#define Screen_Height ([[UIScreen mainScreen] bounds].size.height)
#define Layout_375_x(x) ((x)/375.0 * Screen_Width/2)  //750px 图片
#define Layout_675_y(y) ((y)/675.0 * Screen_Height/2)  //1350px 图片

#define Rect_DEFAULT CGRectMake(x, y, width, height)

#define Layout_360_x(x) (x/360.0 * Screen_Width/2)   //真实使用的时候这个是375，上一个是360，太多了，没办法。
#define Layout_640_y(y) (y/640.0 * Screen_Height/2)

#define LayoutView_375_x(superX,pictureX,pictureSuperX) ((CGFloat)superX * pictureX/pictureSuperX)   //根据父视图来适配


#define LayoutView_675_y(superY,pictureY,pictureSuperY) ((CGFloat)superY * pictureY/pictureSuperY)


#define Left_Distance Layout_375_x(20)
#define Nav_Y (Layout_675_y(64) - Layout_675_y(44)/2)
#define Nav_Height (Layout_675_y(44) * 2)


#define LayoutWithSuperView_360_x(x,pictureSuperX) LayoutView_375_x(self.width, x, pictureSuperX)
#define LayoutWithSuperView_640_y(y,pictureSuperY) LayoutView_675_y(self.height, y, pictureSuperY);


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
