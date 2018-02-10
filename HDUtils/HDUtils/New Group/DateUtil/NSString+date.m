//
//  NSString+date.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/10.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "NSString+date.h"

@implementation NSString (date)
-(NSDate *)dateWithFormat:(NSString *)format{
    NSDateFormatter * df = [[NSDateFormatter alloc] init];
    df.dateFormat = format;
    NSTimeZone *timeZone = [NSTimeZone timeZoneForSecondsFromGMT:88000];;
//
    [df setTimeZone:timeZone];
    return [df dateFromString:self];
    
}
@end
