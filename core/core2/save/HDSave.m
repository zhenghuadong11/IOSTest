//
//  MYCoding.m
//  LiveGuard
//
//  Created by apple on 17/1/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HDSave.h"

@implementation HDSave
#pragma mark --  coding
+(BOOL)saveWithObject:(id)object andSpecialFile:(NSString *)file{
    NSString * baseStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
     NSString * path = [baseStr stringByAppendingPathComponent:file];
    
    BOOL save = [NSKeyedArchiver archiveRootObject:object toFile:path];
    return save;
}

+(id)getWidthFile:(NSString *)file{
    NSString * baseStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
     NSString * path = [baseStr stringByAppendingPathComponent:file];

     return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

#pragma mark --  userDefault
+(void) saveUserDefaultKey:(NSString *) key value:(NSObject *) value{
    NSUserDefaults * uDefaults = [NSUserDefaults standardUserDefaults];
    [uDefaults setObject:value forKey:key];
    [uDefaults synchronize];
}

+(void) deleteUserDefaultKey:(NSString *) key{
    NSUserDefaults * uDefaults = [NSUserDefaults standardUserDefaults];
    [uDefaults removeObjectForKey:key];
    [uDefaults synchronize];
}
+(NSObject *) getUserDefaultKey:(NSString *)key{
    NSUserDefaults * uDefaults = [NSUserDefaults standardUserDefaults];
    return [uDefaults objectForKey:key];
}
#pragma mark --  plist
+(BOOL) savePlistWithDict:(NSDictionary *) object andSpecialFile:(NSString *)file{
    NSString * baseStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
    NSString * path = [baseStr stringByAppendingPathComponent:file];
    return [object writeToFile:path atomically:true];
}
+(NSDictionary *) getDict:(NSDictionary *) object andSpecialFile:(NSString *)file{
    NSString * baseStr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).firstObject;
    NSString * path = [baseStr stringByAppendingPathComponent:file];
    NSDictionary * dict = [NSDictionary dictionaryWithContentsOfFile:path];
    return dict;
}
#pragma mark --  sql
+(BOOL) sqlDBName:(NSString *) sqlString excuteString:(NSString *) excuteString{
    //1.获取数据库文件的路径
    NSString * docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
   
    NSString * sqlName = [sqlString stringByAppendingString:@".sqlite"];
   
    //设置数据库名称
    NSString * fileName = [docPath stringByAppendingPathComponent:sqlName];
    NSLog(@"%@",fileName);
    //2.获取数据库
    FMDatabase * database = [FMDatabase databaseWithPath:fileName];
    if (![database open]) {
        NSLog(@"打开数据库失败");
        return false;
    }else{
        NSLog(@"打开成功");
    }
    
    return false;
}
+(NSArray *) sqlDBName:(NSString *) sqlString selectString:(NSString *) selectString{
    return @[];
}
@end
