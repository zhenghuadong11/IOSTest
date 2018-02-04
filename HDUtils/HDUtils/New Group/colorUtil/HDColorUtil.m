//
//  HDColorUtil.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDColorUtil.h"

@implementation HDColorUtil
+(BOOL)isEquelColor1:(UIColor *)color1 Color2:(UIColor *)color2{
   return CGColorEqualToColor(color1.CGColor, color2.CGColor);
}
@end
