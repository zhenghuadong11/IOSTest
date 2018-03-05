//
//  TipViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/3/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "TipViewController.h"
#import "HDTip.h"
#import "TipView.h"
#import "HDNetConnnect.h"
@interface TipViewController ()

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    TipView * tipView = [[TipView alloc] init];
    tipView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:tipView];
    
    tipView.frame = CGRectMake(50, 50, 50, 50);
    
    NSDictionary * params = @{@"m":@"login",
                              @"loginType":@(2),
                              @"token":@"117cc0543586e3efafa05a6936dfd277"
                              };
    
    
    [HDNetConnnect requestBaseDicBlockWithUrlStr:@"taihe/interfaces/app/serviceUser.do" params:params successBlock:^(NSDictionary *result) {
        [HDTip alertTipTitle:nil message:@"1234"];
    } failtureBlock:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [HDTip alertTipTitle:nil message:@"786"];
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
