//
//  HDUploadRequest.m
//  OrderManager
//
//  Created by apple on 2018/1/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HDUploadRequest.h"

@implementation HDUploadRequest
{
    NSMutableData * _data;
    
}
-(instancetype)initWithURL:(NSURL *)URL{
    if (self = [super initWithURL:URL]) {
        [self setValue:@"multipart/form-data; boundary=----WebKitFormBoundaryftnnT7s3iF7wV5q6" forHTTPHeaderField:@"Content-Type"];
        self.HTTPMethod = @"POST";
        _data = [NSMutableData data];
    }
    return self;
}


-(void)appendPartWithFileData:(NSData *)data paramName:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType{
    
    [_data appendData:[@"------WebKitFormBoundaryftnnT7s3iF7wV5q6" dataUsingEncoding:NSUTF8StringEncoding]];
    [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // 设置传入数据的基本属性， 包括有 传入方式 data ，传入的类型（名称） ，传入的文件名， 。
    [_data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\"",name,fileName] dataUsingEncoding:NSUTF8StringEncoding]];
    [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 设置 内容的类型  “文件类型/扩展名” MIME中的
    [_data appendData:[[@"Content-Type:  " stringByAppendingString:mimeType] dataUsingEncoding:NSUTF8StringEncoding]];
    [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // 加入数据内容
    [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];

    [_data appendData:data];
    [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
}
-(void)setParams:(NSDictionary *)params{
    [_data appendData:[@"------WebKitFormBoundaryftnnT7s3iF7wV5q6" dataUsingEncoding:NSUTF8StringEncoding]];
    for (NSString * key in params.allKeys) {
        [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        /******************非文件参数***************************/
        // 内容设置 ， 设置传入的类型（名称）
        [_data appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"",key] dataUsingEncoding:NSUTF8StringEncoding]];
        [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        // 传入的名称username = lxl
        [_data appendData:[params[key] dataUsingEncoding:NSUTF8StringEncoding]];
        [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    // 退出边界
    [_data appendData:[@"------WebKitFormBoundaryftnnT7s3iF7wV5q6--" dataUsingEncoding:NSUTF8StringEncoding]];
    [_data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
//    NSLog([@"%@",[NSString])
    
    self.HTTPBody = _data;
}


@end
