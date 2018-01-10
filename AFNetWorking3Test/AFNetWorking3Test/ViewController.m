//
//  ViewController.m
//  AFNetWorking3Test
//
//  Created by apple on 2018/1/10.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"
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
    [self download];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) upload{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    UIImage * image = [UIImage imageNamed:@"xiangjiabao"];
    
    NSString * urlString = @"http://localhost:8080/SpringTest/fileupload";
    
    [manager POST:urlString parameters:@{} constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData * data = UIImagePNGRepresentation(image);
        [formData appendPartWithFormData:data name:@"file"];
        
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%lf",1.0*uploadProgress.completedUnitCount/uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"成功上传");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"上传失败");
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
