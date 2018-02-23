//
//  UIColor+RGB.h
//  LiveGuard
//
//  Created by apple on 16/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:arc4random_uniform(256)/255.0]]

@interface UIColor (RGB)
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;
-(BOOL) isEqualToColor:(UIColor *) otherColor;

@end
