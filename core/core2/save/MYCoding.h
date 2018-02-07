//
//  MYCoding.h
//  LiveGuard
//
//  Created by apple on 17/1/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYCoding : NSObject
/*
 ＊ object 对象
 * file 特殊的标志
 */
+(void) saveWithObject:(id) object andSpecialFile:(NSString *)file;

+(id) getWidthFile:(NSString *) file;

@end
