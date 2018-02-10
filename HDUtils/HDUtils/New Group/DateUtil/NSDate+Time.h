//
//  NSDate+Time.h
//  LiveGuard
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+date.h"
@interface NSDate (Time)
-(NSString *) stringWithFormat:(NSString *) format;
-(NSDate *) dateWithFormat:(NSString *) format;
-(BOOL) isToday;
@end
