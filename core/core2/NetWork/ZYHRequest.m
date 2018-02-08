//
//  ZYHRequest.m
//  SchoolClient
//
//  Created by mac on 15/10/29.
//  Copyright © 2015年 mac. All rights reserved.
/*

 {
 "id": "cu-10cddbbf-9015-4a3e-ac2c-1c5fdb962e48",
 "uid": 3,
 "name": "haha",
 "loginPassword": "QEQQwfNqEL4MtlD2JcZifiykFrb2PWEmXzJ3OpUhaFwDLUT",
 "paymentPassword": "vEAAhPLGeczF54qHPGYwlUgT5JPGYkFXLRUzwyv38YIFV",
 "addTime": "Jan 15, 2016 9:10:58 AM",
 "email": "342535324@qq.com",
 "phone": "13607717916",
 "location": "北京 北京市",
 "address": "22",
 "lastLogin": "Feb 15, 2016 8:59:05 AM",
 "balance": "8ebb!YbCJqtykIZY1zS2dQKYOzg=!r0O",
 "integral": "b91a!JEumJh9xDmo!S2P",
 "backupPhone": "11",
 "accountStatus": 1,
 "bankcardInfoId": "aa"
 }

*/

#import "ZYHRequest.h"
#import "Reachability.h"



@implementation ZYHRequest

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

#pragma mark 加密与拼接请求参数

//拼接http请求参数
-(NSMutableString *)jointSortedArray:(NSMutableArray *)parameters{
    if(parameters.count == 0){
       return  [NSMutableString stringWithString:@"&"];
    }
    
    
    NSString *str1 = @"";
    for (NSString *parameter in parameters) {
        str1 = [str1 stringByAppendingFormat:@"%@%@",@"&",parameter];
    }
    NSMutableString *mstr = [NSMutableString stringWithString:str1];
    
    
    return mstr;
}


#pragma mark 异步POST请求
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters{
    
    NSString *URLString = [NSString stringWithFormat:@"%@%@",BASE_URL,urlStr];

    
    NSMutableURLRequest * request = nil;
    

    
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                       cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                   timeoutInterval:30];
    
    request.HTTPMethod = @"POST";
    
    //1.把字典按key=value的方式排例
    NSMutableArray *mArray = [NSMutableArray array];
    
    for (NSString *key in parameters.allKeys) {
        NSString *value = parameters[key];
        NSString *parameter = [NSString stringWithFormat:@"%@=%@",key,value];
        [mArray addObject:parameter];
    }
    
    NSLog(@"url-- %@",URLString);
    
    
    //2.拼接http请求体
    NSMutableString *httpBody = [[self new] jointSortedArray:mArray];
    //把前面的"&"号去除
    NSLog(@"请求体：%@",httpBody);
    NSRange range = {0,1};
    [httpBody deleteCharactersInRange:range];
    //    NSLog(@"网络请求body:%@",httpBody);
   
    //把拼接后的字符串转换为data，设置请求体
   
    
    request.HTTPBody = [httpBody dataUsingEncoding:NSUTF8StringEncoding];
    return request;
}
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr baseUrlNum:(NSInteger)baseUrlNum parameters:(NSDictionary *)parameters{
    
    NSString *URLString;
    
    if (baseUrlNum == 0) {
         URLString = [NSString stringWithFormat:@"%@%@",BASE_URL,urlStr];
    }else{
         URLString = [NSString stringWithFormat:@"%@%@",BASE_URL1,urlStr];
    }
    
   
    
    
    NSMutableURLRequest * request = nil;
    
    
    
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:30];
    
    request.HTTPMethod = @"POST";
    
    //1.把字典按key=value的方式排例
    NSMutableArray *mArray = [NSMutableArray array];
    
    for (NSString *key in parameters.allKeys) {
        NSString *value = parameters[key];
        NSString *parameter = [NSString stringWithFormat:@"%@=%@",key,value];
        [mArray addObject:parameter];
    }
    
    NSLog(@"url-- %@",URLString);
    
    
    //2.拼接http请求体
    NSMutableString *httpBody = [[self new] jointSortedArray:mArray];
    //把前面的"&"号去除
    NSLog(@"请求体：%@",httpBody);
    NSRange range = {0,1};
    [httpBody deleteCharactersInRange:range];
    //    NSLog(@"网络请求body:%@",httpBody);
    
    //把拼接后的字符串转换为data，设置请求体
    
    
    request.HTTPBody = [httpBody dataUsingEncoding:NSUTF8StringEncoding];
    return request;
}
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr parameters:(NSDictionary *)parameters requestTime:(NSTimeInterval)time{
    NSString *URLString = [NSString stringWithFormat:@"%@%@",BASE_URL,urlStr];
    NSMutableURLRequest * request = nil;
    
   // NSLog(@"final post url -- %@",[NSURL URLWithString:URLString]);
    
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:time];
    
    request.HTTPMethod = @"POST";
    
    //1.把字典按key=value的方式排例
    NSMutableArray *mArray = [NSMutableArray array];
    
    for (NSString *key in parameters.allKeys) {
        NSString *value = parameters[key];
        NSString *parameter = [NSString stringWithFormat:@"%@=%@",key,value];
        [mArray addObject:parameter];
    }
    
    //2.拼接http请求体
    NSMutableString *httpBody = [[self new] jointSortedArray:mArray];
    //把前面的"&"号去除
    
    NSRange range = {0,1};
    [httpBody deleteCharactersInRange:range];
    //    NSLog(@"网络请求body:%@",httpBody);
   
    //把拼接后的字符串转换为data，设置请求体
  
    request.HTTPBody = [httpBody dataUsingEncoding:NSUTF8StringEncoding];
    return request;
}

#pragma mark 异步get请求
+(NSURLRequest *)getAsyncRequest:(NSString *)urlStr parameters:(NSDictionary *)parameters{
    

    
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *key in parameters.allKeys) {
        NSString *value = parameters[key];
        NSString *parameter = [NSString stringWithFormat:@"%@=%@",key,value];
        [mArray addObject:parameter];
    }
    
    //2.拼接http请求体
    NSMutableString *httpBody = [[self new] jointSortedArray:mArray];
    //把前面的"&"号去除
    NSRange range = {0,1};
    [httpBody deleteCharactersInRange:range];
    

    
    NSMutableURLRequest * request = nil;
    NSString * URLString = nil;
 
    if (httpBody == nil || [httpBody isEqualToString:@""]) {
        URLString = [NSString stringWithFormat:@"%@%@%@",BASE_URL,urlStr,httpBody];
    }else{
        URLString = [NSString stringWithFormat:@"%@%@?%@",BASE_URL,urlStr,httpBody];
    }

    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:30];
    request.HTTPMethod = @"GET";
    return request;
}




#pragma mark POST上传头像到服务器
-(NSURLRequest *)postAsyncImageRequest:(NSString *)urlStr
                             headImage:(NSData *)imageData
                            parameters:(NSDictionary *)parameters{
    
    //根据url初始化request
    NSString *URLString = [NSString stringWithFormat:@"%@%@",BASE_URL,urlStr];
    _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                       cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                   timeoutInterval:30];
    
    _request.HTTPMethod = @"POST";
    
    //分界线的标识符
    NSString *TWITTERFON_FORM_BOUNDARY = @"AaB03x";
    
    //分界线 --AaB03x
    NSString *MPboundary=[[NSString alloc]initWithFormat:@"--%@",TWITTERFON_FORM_BOUNDARY];
    //结束符 AaB03x--
    NSString *endMPboundary=[[NSString alloc]initWithFormat:@"%@--",MPboundary];
    //要上传图片的data
    //NSData *data = UIImageJPEGRepresentation(image, 1);
    
    //http body的字符串
    NSMutableString *body=[[NSMutableString alloc]init];
    //参数的集合的所有key的集合
    //NSDictionary *params = @{@"mdUsers.id":@"22",@"file":@"data"};
    NSArray *keys= [parameters allKeys];
    
    //遍历keys
    for(int i=0;i<[keys count];i++)
    {
        //得到当前key
        NSString *key=[keys objectAtIndex:i];
        //如果key不是pic，说明value是字符类型，比如name：Boris
        if(![key isEqualToString:@"file"])
        {
            //添加分界线，换行
            [body appendFormat:@"%@\r\n",MPboundary];
            //添加字段名称，换2行
            [body appendFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n",key];
            //添加字段的值
            [body appendFormat:@"%@\r\n",[parameters objectForKey:key]];
        }
    }
    
    //添加分界线，换行
    [body appendFormat:@"%@\r\n",MPboundary];
    //声明file字段，文件名为currentImage.png
    [body appendFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"currentImage.png\"\r\n"];
    //声明上传文件的格式
    [body appendFormat:@"Content-Type: image/png\r\n\r\n"];
    
    //声明结束符：--AaB03x--
    NSString *end=[[NSString alloc]initWithFormat:@"\r\n%@",endMPboundary];
    //声明myRequestData，用来放入http body
    NSMutableData *myRequestData=[NSMutableData data];
    //将body字符串转化为UTF8格式的二进制
    [myRequestData appendData:[body dataUsingEncoding:NSUTF8StringEncoding]];
    //将image的data加入
    [myRequestData appendData:imageData];
    //加入结束符--AaB03x--
    [myRequestData appendData:[end dataUsingEncoding:NSUTF8StringEncoding]];
    
    //设置HTTPHeader中Content-Type的值
    NSString *content=[[NSString alloc]initWithFormat:@"multipart/form-data; boundary=%@",TWITTERFON_FORM_BOUNDARY];
    //设置HTTPHeader
    [_request setValue:content forHTTPHeaderField:@"Content-Type"];
    //设置Content-Length
    [_request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[myRequestData length]] forHTTPHeaderField:@"Content-Length"];
    //设置http body
    [_request setHTTPBody:myRequestData];
    
    //连接服务器
//    NSLog(@"HTTPHead:%@",_request);
//    NSLog(@"HTTPBody:%@",myRequestData);
    return _request;
    
}

#pragma mark headParams
+(NSURLRequest *)postAsyncRequest:(NSString *)urlStr
                       parameters:(NSDictionary *)parameters headParams:(NSDictionary *) headParams{
    NSMutableURLRequest * request = (NSMutableURLRequest *)[ZYHRequest postAsyncRequest:urlStr parameters:parameters];
    for ( NSString * key in headParams) {
        
        [request addValue:headParams[key]  forHTTPHeaderField:key];
    }
    return request;
    
}
+(NSURLRequest *)putAsyncRequest:(NSString *)urlStr
                      parameters:(NSDictionary *)parameters headParams:(NSDictionary *) headParams{
    NSMutableURLRequest * request = (NSMutableURLRequest *)[ZYHRequest getAsyncRequest:urlStr parameters:parameters];
    request.HTTPMethod = @"PUT";
    for ( NSString * key in headParams) {
        
        [request addValue:headParams[key]  forHTTPHeaderField:key];
    }
    return request;
}
+(NSURLRequest *)getAsyncRequest:(NSString *)urlStr parameters:(NSDictionary *)parameters headParams:(NSDictionary *)headParams{
    NSMutableArray *mArray = [NSMutableArray array];
    for (NSString *key in parameters.allKeys) {
        NSString *value = parameters[key];
        NSString *parameter = [NSString stringWithFormat:@"%@=%@",key,value];
        [mArray addObject:parameter];
    }
    
    //2.拼接http请求体
    NSMutableString *httpBody = [[self new] jointSortedArray:mArray];
    //把前面的"&"号去除
    NSRange range = {0,1};
    [httpBody deleteCharactersInRange:range];
    
    
    
    NSMutableURLRequest * request = nil;
    NSString * URLString = nil;
    
    if (httpBody == nil || [httpBody isEqualToString:@""]) {
        URLString = [NSString stringWithFormat:@"%@%@%@",BASE_URL,urlStr,httpBody];
    }else{
        URLString = [NSString stringWithFormat:@"%@%@?%@",BASE_URL,urlStr,httpBody];
    }
    
    request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLString]
                                      cachePolicy:NSURLRequestReloadIgnoringLocalCacheData
                                  timeoutInterval:30];
    
    request.HTTPMethod = @"GET";
    
    for ( NSString * key in headParams) {
       
        [request addValue:headParams[key]  forHTTPHeaderField:key];
    }
    
   
    
    return request;
}

+(NSURLRequest *) addHeadWithHeaderField:(NSString *) field value:(NSString *) value request:(NSURLRequest *) reqeust{
    NSMutableURLRequest * mutableRequest = [reqeust mutableCopy];
    [mutableRequest addValue:value forHTTPHeaderField:field];
    
    return [mutableRequest copy];
    
}





@end
