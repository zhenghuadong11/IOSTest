//
//  MYCoding.m
//  LiveGuard
//
//  Created by apple on 17/1/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HDCoding.h"

@implementation HDCoding

+(void)saveWithObject:(id)object andSpecialFile:(NSString *)file{
    NSString * baseStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
    NSString * path = [baseStr stringByAppendingString:file];
    
    BOOL save = [NSKeyedArchiver archiveRootObject:object toFile:path];
}

+(id)getWidthFile:(NSString *)file{
    NSString * baseStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
    NSString * path = [baseStr stringByAppendingString:file];

     return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

@end
