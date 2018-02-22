//
//  ConvertViewController.m
//  test
//
//  Created by 郑华栋 on 2018/2/14.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ConvertViewController.h"

@interface ConvertViewController ()

@end

@implementation ConvertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

   
    
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    [self test1];
}

#pragma mark 视图中的点转化坐标系后的点位置
-(void) test1{
    UIView * blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    
    UIView * redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    
    UIView * grayView = [[UIView alloc] init];
    grayView.backgroundColor = [UIColor grayColor];
    
    
    blueView.frame = CGRectMake(100, 100, 150, 150);
    redView.frame = CGRectMake(20, 30, 30, 30);
    
    grayView.frame = CGRectMake(120, 120, 70, 70);
    
    [self.view addSubview:blueView];
    [grayView addSubview:redView];
    [self.view addSubview:grayView];
    NSLog(@"%@",NSStringFromCGPoint([grayView convertPoint:redView.frame.origin toView:nil]));
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
