//
//  HDColorUtil.h
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface HDColorUtil : NSObject
+(BOOL) isEquelColor1:(UIColor *) color1 Color2:(UIColor *) color2;

@end
