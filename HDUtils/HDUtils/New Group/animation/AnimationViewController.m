//
//  AnimationViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/22.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "AnimationViewController.h"
#import "HDAnimationUtil.h"
@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton * button = [[UIButton alloc] init];
    button.frame = CGRectMake(130, 130, 50, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
}
-(void) click:(UIButton *) button{
//    [HDAnimationUtil animationView:button keyPath:@"bounds.size" toValue:[NSValue valueWithCGSize:(CGSizeMake(100, 100))]];
    HDAnimationModel * model = [[HDAnimationModel alloc] init];
    model.toValue = [NSValue valueWithCGSize:(CGSizeMake(100, 100))];
    model.duration = 2.5;
    model.repeatCount = 100;
    model.isReverse = true;
    [HDAnimationUtil animationView:button keyPath:@"bounds.size" property:model];
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
