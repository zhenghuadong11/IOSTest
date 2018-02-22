//
//  ViewController.m
//  TipTest
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "HDTip.h"
#import "HDDefine.h"
@interface ViewController ()
@property(nonatomic,strong) HDTip * tip;
@property(nonatomic,strong) NSTimer * timer;
@property(nonatomic,assign) CGFloat progress;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"提示信息" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
//    [alertView show];
    self.view.backgroundColor = [UIColor blueColor];
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
    
    [self test4];

}
-(void) test1{
    [HDTip alertTipTitle:@"标题" message:@"这是提示信息" actions:@{@"1":^{
        [HDTip alertTipTitle:@"test" message:@"1"];
    }} buttons:@"1",@"2",@"3",nil];
}
-(void) test2{
    [HDTip tipHiddenWithText:@"用户不存在"];
}
-(void) test3{
    HDTip  * tip = [[HDTip alloc] init];
    [tip tipHUDWithText:@""];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tip tipHUDHidden];
    });
}
-(void) test4{
    self.tip = [[HDTip alloc] init];
    [self.tip tipHUDCircle:@"Loading..."];
    
    WEAK_SELFINIT;
    self.progress = 0;
    if (@available(iOS 10.0, *)) {
        [NSTimer scheduledTimerWithTimeInterval:0.3 repeats:true block:^(NSTimer * _Nonnull timer) {
            self.progress += 0.1;
            
            weakSelf.tip.progress = self.progress;
            if (self.progress >= 1) {
                [weakSelf.tip tipHUDHidden];
                [timer invalidate];
                timer = nil;
                
            }
        }];
    } else {
        // Fallback on earlier versions
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
