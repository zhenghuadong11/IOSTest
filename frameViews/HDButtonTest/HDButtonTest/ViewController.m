//
//  ViewController.m
//  HDButtonTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ViewController.h"
#import "HDButton.h"
#import "HDDefault.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    HDButton * button = [[HDButton alloc] init];
    
    [self.view addSubview:button];
    
    button.frame = CGRectMake(30, 30, 100, 100);
    button.backgroundColor = [UIColor blueColor];
    button.view.frame = button.bounds;
    button.view.backgroundColor = [UIColor redColor];
    
    button.imageView.frame = CGRectMake(0, 0, 50, 50);
    button.imageView.imageUrl = @"http://img95.699pic.com/photo/50069/5951.jpg_wh300.jpg";
// https://www.jianshu.com/p/2dc061e5ea18?utm_campaign=maleskine&utm_content=note&utm_medium=pc_all_hots&utm_source=recommendation
}
-(void) test1{
    HDButton * button = [[HDButton alloc] init];
    
    [self.view addSubview:button];
    
    button.frame = CGRectMake(30, 30, 100, 100);
    button.backgroundColor = [UIColor blueColor];
    button.view.frame = button.bounds;
    button.view.backgroundColor = [UIColor redColor];
    
    //    button.viewBlock = ^{
    //        NSLog(@"viewBlock");
    //    };
    
    button.label.text = @"提示";
    [button.label sizeToFit];
    [button label].x = button.width - button.label.width;
    button.label.y = (button.height - button.label.height)/2;
    button.labelBlock = ^{
        NSLog(@"labelBlock");
    };
    button.selectBackColor = [UIColor purpleColor];
    NSLog(@"%@",button.isSelect ? @"true" : @"false");
    __weak HDButton * weakButton = button;
    button.selfBlock = ^{
        
        weakButton.isSelect = !weakButton.isSelect;
        //        [weakButton hdSizeToFit];
    };
    button.selectContext = @"不提示";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
