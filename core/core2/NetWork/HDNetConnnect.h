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


@interface HDNetConnnect : NSObject




#pragma mark --  普通的请求，没有经过复杂封装的
/**
 最普通的get请求
 */
+(void)getRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;

/**
 最普通的post请求
 */
+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params withResult:(void (^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;
/**
 *   最普通的带头参数get请求
 */
+(void)getRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;
/**
 *   最普通的带头参数post请求
 */
+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;


/**
 最普通的带头参数,超时时间，URL可选的post请求


 */
+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams requestTime:(NSTimeInterval) time baseUrlNum:(NSInteger)baseUrlNum withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;


/**
 带有请求头的普通put请求
 */
+(void)putRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock;





#pragma mark --  baseRequst
/**
 * 三种基本的处理请求的方式
 */
+(void) requestBaseStrBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params successBlock:(void(^)(NSString * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
+(void) requestBaseArrBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params successBlock:(void(^)(NSArray * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;

/**
 一个好用的baseDict请求
 */
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;



/**
 带有超时时间的baseDict请求
 */
+(void)requestBaseDicBlockWithUrlStr:(NSString *)url params:(NSDictionary *)params requestTime:(NSTimeInterval) time successBlock:(void (^)(NSDictionary *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock;
/**
 baseDict带有头参数的
 */
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params headParams:(NSDictionary *)headParams successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;

/*
 *  可以选择base——url的请求
 */
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params withBaseUrlNum:(NSInteger)baseUrlNum successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;

/**
 带有url，头参数，请求时间的好用dict请求

 @param url <#url description#>
 @param params <#params description#>
 @param headParams <#headParams description#>
 @param time <#time description#>
 @param baseUrlNum <#baseUrlNum description#>
 @param successBlock <#successBlock description#>
 @param failtureBlock <#failtureBlock description#>
 */
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params headParams:(NSDictionary *)headParams requestTime:(NSTimeInterval) time baseUrlNum:(NSInteger)baseUrlNum successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
#pragma mark --  request的base请求
/**
 * 面对request的三种处理请求的方式,主要是用于文件上传的
 */
+(void) requestBaseDicBlockWithRequest:(NSURLRequest *) request successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
+(void) requestBaseArrBlockWithRequest:(NSURLRequest *) request successBlock:(void(^)(NSArray * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
+(void) requestBaseStrBlockWithRequest:(NSURLRequest *) request successBlock:(void(^)(NSString * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock;
#pragma mark --  netUtil

/**
 dict转json字符串
 */
+(NSString *) jsonStringFromDict:(NSDictionary *) dict;


/**
 网络状态是否可以联通，不连通是否出默认提示，提示需要自行添加
 */
+ (BOOL)NetWorkIsOKWithDefaultAction:(BOOL)isAction;

/**
 默认的失败处理，请根据项目自行添加
 */
+ (void) defaultFailtureOperation;
@end
