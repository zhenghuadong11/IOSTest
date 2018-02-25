//
//  ViewController.m
//  AFNetWorking3Test
//
//  Created by apple on 2018/1/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
#define YYEncode(str) [str dataUsingEncoding:NSUTF8StringEncoding]
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"下载" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 0, 50, 50);
    [button addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    
    
}
-(void) click{
    [self upload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) upload{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    UIImage * image = [UIImage imageNamed:@"2"];
    
    NSString * urlString = @"http://192.168.16.21:8080/SpringTest/fileupload";
    //    request.allHTTPHeaderFields = @{
    //                                    @"Content-Type":[NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary]
    //                                    };
//       manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json", nil];
    [manager POST:urlString parameters:@{@"username":@"Saup"} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData * data = UIImagePNGRepresentation(image);
//        [formData appendPartWithFormData:data name:@"file"];
        
         [formData appendPartWithFileData:data name:@"file" fileName:@"vrad.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%lf",1.0*uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功上传");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败");
    }];
    
}
//- (void)upload:(NSString *)name filename:(NSString *)filename mimeType:(NSString *)mimeType data:(NSData *)data parmas:(NSDictionary *)params

-(void)uploadWith{
    

    
    
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/SpringTest/fileupload"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 设置请求头数据 。  boundary：边界
    [request setValue:@"multipart/form-data; boundary=----WebKitFormBoundaryftnnT7s3iF7wV5q6" forHTTPHeaderField:@"Content-Type"];
    
    // 给请求体加入固定格式数据
    NSMutableData *data = [NSMutableData data];
    /*******************设置文件参数***********************/
    // 设置边界 注：必须和请求头数据设置的边界 一样， 前面多两个“-”；（字符串 转 data 数据）
    [data appendData:[@"------WebKitFormBoundaryftnnT7s3iF7wV5q6" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // 设置传入数据的基本属性， 包括有 传入方式 data ，传入的类型（名称） ，传入的文件名， 。
    [data appendData:[@"Content-Disposition: form-data; name=\"file\"; filename=\"image.jpeg\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 设置 内容的类型  “文件类型/扩展名” MIME中的
    [data appendData:[@"Content-Type: image/jpeg" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // 加入数据内容
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    UIImage *image = [UIImage imageNamed:@"xiangjiabao"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [data appendData:imageData];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // 设置边界
    [data appendData:[@"------WebKitFormBoundaryftnnT7s3iF7wV5q6" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    /******************非文件参数***************************/
    // 内容设置 ， 设置传入的类型（名称）
    [data appendData:[@"Content-Disposition: form-data; name=\"username\"" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 传入的名称username = lxl
    [data appendData:[@"lxl" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    // 退出边界
    [data appendData:[@"------WebKitFormBoundaryftnnT7s3iF7wV5q6--" dataUsingEncoding:NSUTF8StringEncoding]];
    [data appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    request.HTTPBody = data;
    
    // 设置请求方式 post
    request.HTTPMethod = @"POST";
    
    
    
    [NSURLConnection sendAsynchronousRequest:request  queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];

    
    
    
}

-(void) download{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    NSURL * url = [NSURL URLWithString:@"http://192.168.16.21:8080/SpringTest/downLoad"];
    //http://localhost:8080/SpringTest/downLoad
    //http://img.yiyangzzt.com/uc/icon_2.png
    __weak typeof(self) weakSelf = self;
    
    
    
    
    
    
    NSURLSessionDownloadTask * task = [manager downloadTaskWithRequest:[NSURLRequest requestWithURL:url] progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"%lf",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSLog(@"默认下载地址:%@",targetPath);
        
        //设置下载路径，通过沙盒获取缓存地址，最后返回NSURL对象
        NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
        return [NSURL fileURLWithPath:[filePath stringByAppendingString:@"/1.tmp"]];
        return targetPath;
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"下载完成：");
        NSLog(@"%@",filePath);
        UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:filePath]];
        
        
        
        weakSelf.view.layer.contents = (id) image.CGImage;
        
        
    }];
    [task resume];
    
}



@end
