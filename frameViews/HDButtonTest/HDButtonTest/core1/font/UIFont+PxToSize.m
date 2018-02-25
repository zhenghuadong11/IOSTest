//
//  UIFont+PxToSize.m
//  LiveGuard
//
//  Created by zhenghuadong on 16/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "UIFont+PxToSize.h"
#import "HDDefault.h"
@implementation UIFont (PxToSize)
+(instancetype)fontWithPx:(CGFloat)px{
    
    return [UIFont systemFontOfSize:Layout_675_y(px)];
}

@end
