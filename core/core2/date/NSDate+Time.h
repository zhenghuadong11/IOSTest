//
//  NSDate+Time.h
//  LiveGuard
//
//  Created by apple on 17/2/16.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Time)
-(NSString *) stringWithFormat:(NSString *) format;
-(BOOL) isToday;
@end
