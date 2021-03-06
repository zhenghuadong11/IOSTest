//
//  MYCoding.h
//  LiveGuard
//
//  Created by apple on 17/1/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
@interface HDSave : NSObject

/**
  encode的对象，从文件中取出来，注意要是encode到基础的类型和对象，所有自定义的对象都要有encode协议
 
 @param object encode协议的对象
 @param file 文件名字，默认存在document中，没有拓展名，即没有.
 */
+(BOOL) saveWithObject:(id) object andSpecialFile:(NSString *)file;

/**
 decode的对象，从文件中取出来，注意要是encode到基础的类型和对象，所有自定义的对象都要有encode协议

 @param file 文件名字，默认存在document中
 @return 文件对象
 */
+(id) getWidthFile:(NSString *) file;



#pragma mark --  UserDefault
+(void) saveUserDefaultKey:(NSString *) key value:(NSObject *) value;
+(void) deleteUserDefaultKey:(NSString *) key;
+(NSObject *) getUserDefaultKey:(NSString *)key;


#pragma mark --  plist

/**
 plist存储

 @param object <#object description#>
 @param file 文件名，以.plist结尾
 @return <#return value description#>
 */
+(BOOL) savePlistWithDict:(NSDictionary *) object andSpecialFile:(NSString *)file;
+(NSDictionary *) getDict:(NSDictionary *) object andSpecialFile:(NSString *)file;

#pragma mark --  本地sql

/**
 在数据库sqlString中执行数据库语句excuteString；

 @param sqlString 数据库的名字，传nil的时候默认为HDSQL
 @param excuteString 数据库执行语句
 @return 执行是否成功
 */
+(BOOL) sqlDBName:(NSString *) sqlString excuteString:(NSString *) excuteString;
/**
 数据库查询

 @param sqlString 数据库的名字，
 @param selectString 数据库的名字，传nil的时候默认为HDSQL
 @return 返回查询的结果，nil的时候是查询错误，空的时候是没有相应数据
 */
+(NSArray *) sqlDBName:(NSString *) sqlString selectString:(NSString *) selectString;

+(BOOL) sqlDBName:(NSString *) sqlString;
@end
