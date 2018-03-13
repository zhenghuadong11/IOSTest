//
//  MYMath.m
//  LiveGuard
//
//  Created by apple on 16/12/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "MYMath.h"

@implementation MYMath

/**
 *  算两条直线的交点
 *   y = kx + b
 **/
+(CGPoint)getJiaodianWith:(CGPoint)lineAPoint lineAAngle:(CGFloat)lineAAngle andLineBPoint:(CGPoint)lineBPoint lineBAngle:(CGFloat)lineBAngle{
    
    CGFloat aK = tan(lineAAngle);
    CGFloat bK = tan(lineBAngle);
    CGFloat aB = lineAPoint.y -  (lineAPoint.x * aK);
    CGFloat bB = lineBPoint.y - (lineBPoint.x * bK);
    
    CGFloat x = -(aB - bB)/(aK -bK);
    CGFloat y = (bB * aK - aB * bK)/(aK - bK);
    
    return CGPointMake(x, y);
}

@end
