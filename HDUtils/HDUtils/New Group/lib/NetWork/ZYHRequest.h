//
//  ZYHRequest.h
//  SchoolClient
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    FixedEncrypt = 0,
    RandomEncrypt,
    NoneEncrypt
};

typedef uint32_t EncryptOption;
//http://health.yiyangzzt.com/
//http://192.168.16.4:8082/
//http://192.168.16.222:8082/
//http://ucenter.yiyangzzt.com/
#define BASE_URL @"http://yun.yiyangzzt.com/"
#define BASE_URL1 @"http://yun.yiyangzzt.com/"
//192.168.16.222:8080

@interface ZYHRequest : NSObject
{
    NSMutableURLRequest * _request;
    NSURLConnection *_connection;
    NSMutableData *_responseData;
}

+ (BOOL)NetWorkIsOK;//检查网络是否可用

#pragma mark --  getRequest
/**
 最普通的get请求
 */
+(NSURLRequest *)getAsyncRequest:(NSString *)urlStr
                      parameters:(NSDictionary *)parameters;
/**
 * 异步get请求头添加参数请求
 */
+(NSURLRequest *)getAsyncRequest:(NSString *)urlStr
                      parameters:(NSDictionary *)parameters headParams:(NSDictionary *) headParams;
#pragma mark --  put请求
/**
 put
 */
+(NSURLRequest *)putAsyncRequest:(NSString *)urlStr
                      parameters:(NSDictionary *)parameters headParams:(NSDictionary *) headParams;



#pragma mark --  post请求

/**
 *  异步POST请求
 */
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters;


                
/**
 url可选的request
 */
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters requestTime:(NSTimeInterval) time;
/**
 headParam的request
 */
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters headParams:(NSDictionary *) headParams;

/**
 url可选的request
 */
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr baseUrlNum:(NSInteger) baseUrlNum
                       parameters:(NSDictionary *)parameters;
/**
 返回带有url，param，headParam，overTime，url可选的request
 */
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters headParams:(NSDictionary *)  headParams requestTime:(NSTimeInterval) time baseURLNum:(NSInteger) urlNum;




@end
