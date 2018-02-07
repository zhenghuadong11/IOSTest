//
//  NSDate+Time.m
//  LiveGuard
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NSDate+Time.h"

@implementation NSDate (Time)


-(NSString *) stringWithFormat:(NSString *) format{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}
-(BOOL)isToday{

    
    if ([[self stringWithFormat:@"yyyy-MM-dd"] isEqualToString:[[NSDate date] stringWithFormat:@"yyyy-MM-dd"]]) {
        return true;
    }
    return false;
}
@end
