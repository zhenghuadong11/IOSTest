//
//  MYNetConnnect.h
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYHRequest.h"
typedef enum{
    RequestStyle_Get_Add = 0,
    RequestStyle_Get,
    RequestStyle_Post,
    RequestStyle_Post_Add,
    RequestStyle_Get_newAdd,
    RequestStyle_Post_newAdd
}RequestStyle;


@interface MYNetConnnect : NSObject


+(void) request:(NSURLRequest *) requst withResult:(void(^)(NSData * data,NSURLResponse * responsse,NSError * error)) resultBlock;


+(void)getRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;
/*
 *   get请求的头有参数请求
 */
+(void)getRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;

+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;

+(void)putRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;


+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params withResult:(void (^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;






+ (BOOL)NetWorkIsOKWithDefaultAction:(BOOL)isAction;


+ (void) defaultFailtureOperation;


/**
 * 三种基本的处理请求的方式
 */
+(void) requestBaseStrBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params successBlock:(void(^)(NSString * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
+(void) requestBaseArrBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params successBlock:(void(^)(NSArray * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;

/*
 * 面对request的三种处理请求的方式
 */
+(void) requestBaseDicBlockWithRequest:(NSURLRequest *) request successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
+(void) requestBaseArrBlockWithRequest:(NSURLRequest *) request successBlock:(void(^)(NSArray * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
+(void) requestBaseStrBlockWithRequest:(NSURLRequest *) request successBlock:(void(^)(NSString * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;

+(void)requestBaseDicBlockWithUrlStr:(NSString *)url params:(NSDictionary *)params requestTime:(NSTimeInterval) time successBlock:(void (^)(NSDictionary *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock;

/*
 *  可以选择base——url的请求
 */
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params withBaseUrlNum:(NSInteger)baseUrlNum successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;

+(NSString *) jsonStringFromDict:(NSDictionary *) dict;


/*
 * 带请求头
 *
 */


@end
