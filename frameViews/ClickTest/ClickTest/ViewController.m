//
//  ViewController.m
//  ClickTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ViewController.h"
#import "ClickButton.h"
#import "GesView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    GesView * view = [[GesView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    view.name = @"view";
    view.backgroundColor = [UIColor blueColor];
    
    GesView * view1 = [[GesView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    [view addSubview:view1];
    view1.backgroundColor = [UIColor redColor];
    view1.name = @"view1";
    GesView * view2 = [[GesView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [view1 addSubview:view2];
    view2.backgroundColor = [UIColor purpleColor];
    view2.name = @"view2";

    GesView * view3 = [[GesView alloc] initWithFrame:CGRectMake(300, 100, 100, 100)];
    view3.name = @"view3";
    view3.backgroundColor = [UIColor greenColor];
    [view addSubview:view3];
}
-(void) test1{
    GesView * view = [[GesView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor blueColor];
    
    ClickButton * button = [[ClickButton alloc] init];
    
    //    [button addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    [view addSubview:button];
    button.frame = CGRectMake(30, 30, 50, 50);
    button.backgroundColor = [UIColor redColor];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [button addGestureRecognizer:tap];
    UITapGestureRecognizer * viewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTap)];
    [view addGestureRecognizer:viewTap];
}
-(void) click{
    NSLog(@"click");
}
-(void) tap{
    NSLog(@"tap");
}
-(void) viewTap{
    NSLog(@"viewTap");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
