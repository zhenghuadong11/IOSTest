//
//  MYNetConnnect.m
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HDNetConnnect.h"
#import "HDTip.h"

@implementation HDNetConnnect

+(void)request:(NSURLRequest *)requst withResult:(void (^)(NSData *, NSURLResponse *, NSError *))resultBlock{

    NSURLSession * session = [NSURLSession sharedSession];
    
  
    
    NSURLSessionDataTask * dataTask = [session dataTaskWithRequest:requst completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            resultBlock(data,response,error);
        });
    }];
    [dataTask resume];
}









#pragma mark -- 普通get请求
+(void)getRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params withResult:(void (^)(NSData *, NSURLResponse *, NSError *))resultBlock{
    NSURLRequest * request = nil;
    
    request = [ZYHRequest getAsyncRequest:requestUrlStr parameters:params];
    
    [self request:request withResult:resultBlock];
}
+(void)getRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock{
    NSURLRequest * request = nil;
    
    request = [ZYHRequest getAsyncRequest:requestUrlStr parameters:params headParams:headParams];
    
    [self request:request withResult:resultBlock];
}
#pragma mark -- 普通post请求
+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params withResult:(void (^)(NSData *, NSURLResponse *, NSError *))resultBlock{
    NSURLRequest * request = nil;
    
    request = [ZYHRequest postAsyncRequest:requestUrlStr parameters:params];
    
    [self request:request withResult:resultBlock];
}
+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params withBaseUrlNum:(NSInteger)baseUrlNum withResult:(void (^)(NSData *, NSURLResponse *, NSError *))resultBlock{
    NSURLRequest * request = nil;
    
    request = [ZYHRequest postAsyncRequest:requestUrlStr baseUrlNum:baseUrlNum parameters:params];
    
    [self request:request withResult:resultBlock];
}



+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params requestTime:(NSTimeInterval)time withResult:(void (^)(NSData *, NSURLResponse *, NSError *))resultBlock{
    
    NSURLRequest * request = nil;
    
    request = [ZYHRequest postAsyncRequest:requestUrlStr parameters:params requestTime:time];
    
    [self request:request withResult:resultBlock];
}




+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock{
     NSURLRequest * request = nil;
    request = [ZYHRequest postAsyncRequest:requestUrlStr parameters:params headParams:headParams];
    
    [self request:request withResult:resultBlock];
}

+(void)putRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock{
     NSURLRequest * request = nil;
    request = [ZYHRequest putAsyncRequest:requestUrlStr parameters:params headParams:headParams];
    
    [self request:request withResult:resultBlock];
}
+(void)postRequest:(NSString *)requestUrlStr WithParams:(NSDictionary *)params headParams:(NSDictionary *)headParams requestTime:(NSTimeInterval) time baseUrlNum:(NSInteger)baseUrlNum withResult:(void(^)(NSData * data,NSURLResponse * response,NSError * error)) resultBlock{
    
}


#pragma mark -- 默认的返回字典，字符串和数组
+(void)requestBaseArrBlockWithUrlStr:(NSString *)url params:(NSDictionary *)params successBlock:(void (^)(NSArray *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock{
    
    [HDNetConnnect postRequest:url WithParams:params withResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }
        NSArray * result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        if (successBlock != nil) {
            successBlock(result);
        }
        
    }];
}



+(void)requestBaseDicBlockWithUrlStr:(NSString *)url params:(NSDictionary *)params successBlock:(void (^)(NSDictionary *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock{
    
    
    [HDNetConnnect postRequest:url WithParams:params withResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }
      
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];

        if (successBlock != nil) {
            successBlock(result);
        }
        
    }];
    
    
    
}
+(void)requestBaseStrBlockWithUrlStr:(NSString *)url params:(NSDictionary *)params successBlock:(void (^)(NSString *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock{

    [HDNetConnnect postRequest:url WithParams:params withResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }

        NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];

        if (successBlock != nil) {
            successBlock(result);
        }
    }];

}

#pragma mark --  base请求的特殊需要

/**
 下面的加上时间；
 */
+(void)requestBaseDicBlockWithUrlStr:(NSString *)url params:(NSDictionary *)params requestTime:(NSTimeInterval) time successBlock:(void (^)(NSDictionary *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock{
    
    
    [HDNetConnnect postRequest:url WithParams:params requestTime:time withResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }
        
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
      

        if (successBlock != nil) {
            successBlock(result);
        }
        
    }];
    
}

+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params withBaseUrlNum:(NSInteger)baseUrlNum successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock{
    [HDNetConnnect postRequest:url WithParams:params withBaseUrlNum:baseUrlNum withResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }
        
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
      
        if (successBlock != nil) {
            successBlock(result);
        }
        
    }];
}
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params headParams:(NSDictionary *)headParams successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock{
    [HDNetConnnect postRequest:url WithParams:params headParams:headParams withResult:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            
            return;
        }
        
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        if (successBlock != nil) {
            successBlock(result);
        }
    }];
}
+(void) requestBaseDicBlockWithUrlStr:(NSString *) url params:(NSDictionary *)params headParams:(NSDictionary *)headParams requestTime:(NSTimeInterval) time baseUrlNum:(NSInteger)baseUrlNum successBlock:(void(^)(NSDictionary * result)) successBlock failtureBlock:(void(^)(NSError * result)) failtureBlock{
    
}
#pragma mark --  request请求，主要用于上传文件
+(void)requestBaseDicBlockWithRequest:(NSURLRequest *)request successBlock:(void (^)(NSDictionary *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock{
    [self request:request withResult:^(NSData *data, NSURLResponse *responsse, NSError *error) {
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }
        
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        if (successBlock != nil) {
            successBlock(result);
        }
    }];
}


+(void)requestBaseArrBlockWithRequest:(NSURLRequest *)request successBlock:(void (^)(NSArray *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock{
    [self request:request withResult:^(NSData *data, NSURLResponse *responsse, NSError *error) {
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }
        NSArray * result = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        
        
        if (successBlock != nil) {
            successBlock(result);
        }
    }];
}
+(void)requestBaseStrBlockWithRequest:(NSURLRequest *)request successBlock:(void (^)(NSString *))successBlock failtureBlock:(void (^)(NSError *))failtureBlock{
    [self request:request withResult:^(NSData *data, NSURLResponse *responsse, NSError *error) {
        if (error != nil){
            [HDNetConnnect defaultFailtureOperation];
            if(failtureBlock != nil)
            {
                failtureBlock(error);
            }
            return;
        }
        
        NSString *result = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
        if (successBlock != nil) {
            successBlock(result);
        }
    }];
}

#pragma mark --  网络工具
+(NSString *)jsonStringFromDict:(NSDictionary *)dict{
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    if (jsonData != nil) {
        return [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }else{
        return @"";
    }
}


#pragma mark -- 网络连接
+(BOOL)NetWorkIsOK{
    return [ZYHRequest NetWorkIsOK];
}

+(BOOL)NetWorkIsOKWithDefaultAction:(BOOL)isAction{
    
    BOOL isOk = [self NetWorkIsOK];
    if (isAction == true) {
        if (isOk == NO){
            
        }
    }
    return isOk;
}
+(void)defaultFailtureOperation{
    
}
@end
