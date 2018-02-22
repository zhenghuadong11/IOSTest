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
@property(nonatomic,strong) HDPullDownView * pullView;
@end

@implementation PullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UIView * buttonBackView = [[UIView alloc] init];
    buttonBackView.frame = CGRectMake(100, 100, 300, 300);
    
    
    
    
    UIButton * button = [[UIButton alloc] init];
    
    
    
    button.frame = CGRectMake(20,10, 120, 230);
    
    button.backgroundColor = [UIColor redColor];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
//    [buttonBackView addSubview:button];
//    [self.view addSubview:buttonBackView];
    self.navigationItem.titleView = button;
    self.pullView = [[HDPullDownView alloc] init];
    self.pullView.items = @[@"23",@"45",[UIImage imageNamed:@"orange"]];

}
-(void) buttonClick:(UIButton *) button{


    
    
    [self.pullView troggleToView:button parentView:self.view];
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
