//
//  RequestButtonViewController.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "RequestButtonViewController.h"
#import "HDRequestButton.h"
@interface RequestButtonViewController ()

@end

@implementation RequestButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    HDRequestButton * btn = [HDRequestButton buttonWithType:(UIButtonTypeCustom)];
    
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 100, 200, 100);
    btn.backgroundColor =[UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    [btn setNormalTest:@"登陆" requestTest:@"正在登陆中..."];
}

-(void) btnClick:(HDRequestButton *)btn{
    [btn isRequesting:true];
    if (@available(iOS 10.0, *)) {
        [NSTimer scheduledTimerWithTimeInterval:3 repeats:false block:^(NSTimer * _Nonnull timer) {
            NSLog(@"%@",[NSThread currentThread]);
            [btn isRequesting:false];
        }];
    } else {
        // Fallback on earlier versions
    };
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
