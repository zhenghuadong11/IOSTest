//
//  ViewController.m
//  TipTest
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "HDTip.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"提示信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
//    [alertView show];
[HDTip alertTipTitle:@"标题" message:@"这是提示信息"];
 
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [button addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
}
-(void) click{
//    [HDTip alertTipTitle:@"标题" message:@"这是提示信息" buttons:@[@"1",@"2",@"3"] actions:@{@"1":^{
//        [HDTip alertTipTitle:@"test" message:@"1"];
//    }}];
    
    [HDTip alertTipTitle:@"标题" message:@"这是提示信息" actions:@{@"1":^{
        [HDTip alertTipTitle:@"test" message:@"1"];
    }} buttons:@"1",@"2",@"3",nil];
//    [HDTip alertTipTitle:@"标题" message:@"这是提示信息"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
