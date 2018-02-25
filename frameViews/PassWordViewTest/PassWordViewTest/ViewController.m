//
//  ViewController.m
//  PassWordViewTest
//
//  Created by 郑华栋 on 2018/2/23.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ViewController.h"
#import "HDPassWordView.h"
@interface ViewController ()<HDPassWordViewDelegate>
@property(nonatomic,strong)  HDPassWordView * passWord;
@property(nonatomic,assign) NSInteger i;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * button = [[UIButton alloc] init];
    button.frame = CGRectMake(0, 0, 50, 50);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.passWord = [[HDPassWordView alloc] init];
    self.passWord.delegate = self;
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) click{
    [self.passWord troggleView:self.view];
}
-(void)passWordView:(HDPassWordView *)view password:(NSString *)password{
    [self.passWord hiddenView];
    NSLog(@"password: %@",password);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
