//
//  NSObject+Util.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/14.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "NSObject+Util.h"

@implementation NSObject (Util)
-(NSObject *)defaultValue:(NSObject *)object{
    if (self == nil) {
        return object;
    }
    return self;
}
@end
