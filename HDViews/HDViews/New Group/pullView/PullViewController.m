//
//  PullViewController.m
//  HDViews
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "PullViewController.h"
#import "HDPullDownView.h"
@interface PullViewController ()

@end

@implementation PullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    
    
    
    
    UIButton * button = [[UIButton alloc] init];
    
    button.frame = CGRectMake(100,100, 120, 230);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    
    NSLog(@"x: %lf, y: %lf",[button convertPoint:CGPointMake(10, 0) toView:nil].x,[button convertPoint:CGPointMake(0, 0) toView:nil].y);
}
-(void) buttonClick:(UIButton *) button{
    HDPullDownView * pullView = [[HDPullDownView alloc] init];
    pullView.items = @[@"23",@"45",[UIImage imageNamed:@"orange"]];
    [pullView showToView:button parentController:self];
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
