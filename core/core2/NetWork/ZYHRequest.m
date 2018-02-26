//
//  ZYHRequest.m
//  SchoolClient
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 mac. All rights reserved.
/*



*/

#import "ZYHRequest.h"
#import "Reachability.h"
#import "HDDefault.h"


@implementation ZYHRequest



#pragma mark 异步get请求
+(NSURLRequest *)getAsyncRequest:(NSString *)urlStr parameters:(NSDictionary *)parameters{
    return [self getAsyncRequest:urlStr parameters:parameters headParams:@{}];
}
+(NSURLRequest *)getAsyncRequest:(NSString *)urlStr parameters:(NSDictionary *)parameters headParams:(NSDictionary *)headParams{
    NSMutableString * httpBody = [NSMutableString string];
    
    BOOL isFirst = true;
    
    for (NSString *key in parameters.allKeys) {
        NSString *value = parameters[key];
        if (isFirst) {
            [httpBody appendString:[NSString stringWithFormat:@"%@=%@",key,value]];
        }else{
            [httpBody appendString:[NSString stringWithFormat:@"&%@=%@",key,value]];
        }
        isFirst = false;
    }
    

    
    
    
    NSMutableURLRequest * request = nil;
    NSString * URLString = nil;
    if (httpBody == nil || [httpBody isEqualToString:@""]) {
        URLString = [NSString stringWithFormat:@"%@%@%@",BASE_URL,urlStr,httpBody];
    }else{
        URLString = [NSString stringWithFormat:@"%@%@?%@",BASE_URL,urlStr,httpBody];
    }
    
    HDLog(@"url-- %@",BASE_URL);
    HDLog(@"请求体：%@",httpBody);
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:30];
    
    request.HTTPMethod = @"GET";
    
    for ( NSString * key in headParams) {
        
        [request addValue:headParams[key]  forHTTPHeaderField:key];
    }

    return request;
}
#pragma mark put请求
+(NSURLRequest *)putAsyncRequest:(NSString *)urlStr
                      parameters:(NSDictionary *)parameters headParams:(NSDictionary *) headParams{
    NSMutableURLRequest * request = (NSMutableURLRequest *)[ZYHRequest getAsyncRequest:urlStr parameters:parameters];
    request.HTTPMethod = @"PUT";
    for ( NSString * key in headParams) {
        
        [request addValue:headParams[key]  forHTTPHeaderField:key];
    }
    return request;
}
#pragma mark 异步POST请求

+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters{
    
    return [self postAsyncRequest:urlStr parameters:parameters headParams:@{} requestTime:-1 baseURLNum:0];
   
}
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr baseUrlNum:(NSInteger)baseUrlNum parameters:(NSDictionary *)parameters{
    return [self postAsyncRequest:urlStr parameters:parameters headParams:@{} requestTime:-1 baseURLNum:baseUrlNum];
}
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr parameters:(NSDictionary *)parameters requestTime:(NSTimeInterval)time{

    return [self postAsyncRequest:urlStr parameters:parameters headParams:@{} requestTime:time baseURLNum:0];
}



+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters headParams:(NSDictionary *)  headParams requestTime:(NSTimeInterval) time baseURLNum:(NSInteger) urlNum{
    NSString *URLString;
    
    if (urlNum == 0) {
        URLString = [NSString stringWithFormat:@"%@%@",BASE_URL,urlStr];
    }else{
        URLString = [NSString stringWithFormat:@"%@%@",BASE_URL1,urlStr];
    }

    
    NSMutableURLRequest * request = nil;
    
    NSTimeInterval timout = time;
    if (timout <= 0) {
        timout = 30;
    }
    
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:timout];
    
    request.HTTPMethod = @"POST";
    
    NSMutableString * httpBody = [NSMutableString string];

    BOOL isFirst = true;
    
    for (NSString *key in parameters.allKeys) {
        NSString *value = parameters[key];
        if (isFirst) {
            [httpBody appendString:[NSString stringWithFormat:@"%@=%@",key,value]];
        }else{
            [httpBody appendString:[NSString stringWithFormat:@"&%@=%@",key,value]];
        }
        isFirst = false;
    }
    
    HDLog(@"url-- %@",URLString);
    
    HDLog(@"请求体：%@",httpBody);

    request.HTTPBody = [httpBody dataUsingEncoding:NSUTF8StringEncoding];

    
    for ( NSString * key in headParams) {
        [request addValue:headParams[key]  forHTTPHeaderField:key];
    }
    return request;
    
}

+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters headParams:(NSDictionary *) headParams{
    return [self postAsyncRequest:urlStr parameters:parameters headParams:headParams requestTime:-1 baseURLNum:0];
}




#pragma mark 加密与拼接请求参数

//拼接http请求参数
-(NSMutableString *)jointSortedArray:(NSMutableArray *)parameters{
    if(parameters.count == 0){
        return  [NSMutableString stringWithString:@"&"];
    }
    
    
    NSMutableString *mstr = [NSMutableString string];
    for (NSString *parameter in parameters) {
        [mstr appendString:[NSString stringWithFormat:@"&%@",parameter]];
    }
 
    
    return mstr;
}


//这个函数是判断网络是否可用的函数（wifi或者蜂窝数据可用，都返回YES）
+ (BOOL)NetWorkIsOK{
    //    return true;
    if(
       ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus]
        != NotReachable)
       ){
        return YES;
    }else{
        return NO;
    }
}

@end
