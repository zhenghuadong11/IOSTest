//
//  ViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ViewController.h"
#import "KeyBoardHeihgtViewController.h"
#import "NullViewController.h"
#import "DateViewController.h"
#import "AnimationViewController.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.models = @[@"键盘弹出高度处理",@"对空的处理",@"日期处理",@"动画"];
    self.nextControllers = @[[[KeyBoardHeihgtViewController alloc] init],            [[NullViewController alloc] init],
        [[DateViewController alloc] init],
        [[AnimationViewController alloc] init]];
    // Do any additional setup after loading the view, typically from a nib.
//    NSMutableArray
    
    

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
