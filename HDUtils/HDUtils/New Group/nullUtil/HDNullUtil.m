//
//  HDNullUtil.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/5.
//  Copyright © 2018年 郑华栋. All rights reserved.
//
/*
 *  这里负责对空对象的处理
 */
#import "HDNullUtil.h"
#import "HDTip.h"
@implementation HDNullUtil
+(BOOL)checkNull:(NSArray *)objects tips:(NSArray<NSString *> *)tips isStrict:(BOOL)isStrict{
    
    NSInteger index = 0;
    for (NSObject * obj in objects) {
        if (obj == nil) {
            [HDTip alertTipTitle:@"" message:tips[index]];
            return true;
        }
        if (isStrict && [obj isKindOfClass:[NSString class]]) {
            NSString * str = (NSString *) obj;
            if ([str isEqualToString:@""]) {
                [HDTip alertTipTitle:@"" message:tips[index]];
                return true;
            }
        }
        
        index += 1;
    }
    
    return false;
}
+(BOOL) checkNulltips:(NSArray<NSString *> *) tips isStrict:(BOOL) isStrict objects:(NSObject *) object,...{
    va_list args ; // typedef char* va_list;
    
    //对args（列表指针）进行初始化,它指向可变参数表里面的第一个参数\
    第一个参数是args本身，第二个参数是在变参表前面紧挨着的一个变量,即“...”之前的那个参数；
    
    if (object == nil) {
        [HDTip alertTipTitle:@"" message:tips[0]];
        return true;
    }
    if (isStrict == true && [object isKindOfClass:[NSString class]] && [((NSString *)object) isEqualToString:@""]) {
        [HDTip alertTipTitle:@"" message:tips[0]];
        return true;
    }
    
    NSInteger index = 1;
    
    va_start(args, object);
    if (object) {
        NSObject *otherObj;
        while (1) {
            //va_arg: 第二个参数是获取了类型。然后返回这个指定类型的值
            //并把args的位置指向变参表的下一个变量位置
            otherObj = va_arg(args, NSObject *);
            if (otherObj == nil) {
                [HDTip alertTipTitle:@"" message:tips[index]];
                return true;
            }
        
            
            if (isStrict == true && [otherObj isKindOfClass:[NSString class]] && [((NSString *)otherObj) isEqualToString:@""]) {
                [HDTip alertTipTitle:@"" message:tips[index]];
                return true;
            }
      
            index += 1;
        }
    }
    //va_end(arg_ptr)：清空参数列表，并置参数指针arg_ptr无效
    //获取完成后，需要将指针关掉，以避免发生危险
    va_end(args);
    return false;
}
@end
