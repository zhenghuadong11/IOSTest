//
//  ViewController.m
//  ScrollView
//
//  Created by 郑华栋 on 2018/2/7.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ViewController.h"
#import "ScrollerView.h"
#import "ScrollViewItem.h"
@interface ViewController ()
@property(nonatomic,strong) ScrollerView * scrollView;
@property(nonatomic,strong) ScrollViewItem * scrollViewItem1;
@property(nonatomic,strong) ScrollViewItem * scrollViewItem2;
@property(nonatomic,strong) ScrollViewItem * scrollViewItem3;
@property(nonatomic,strong) ScrollViewItem * scrollViewItem4;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setDefault];
    [self setSubViews];
    [self setConfig];
    [self setDelegateOrClick];
    [self setFrameOrLayout];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) setDefault{
    
}
-(void) setSubViews{
    self.scrollView = [[ScrollerView alloc] init];
    self.scrollViewItem1 = [[ScrollViewItem alloc] init];
    self.scrollViewItem2 = [[ScrollViewItem alloc] init];
    self.scrollViewItem3 = [[ScrollViewItem alloc] init];
    self.scrollViewItem4 = [[ScrollViewItem alloc] init];
    [self.view addSubview:self.scrollView];
//    [self.scrollView addSubview:self.scrollViewItem1];
//    [self.scrollView addSubview:self.scrollViewItem2];
//    [self.scrollView addSubview:self.scrollViewItem3];
}
-(void) setDelegateOrClick{
    
}
-(void) setConfig{
    self.scrollViewItem1.title = @"item1";
    self.scrollViewItem2.title = @"item2";
    self.scrollViewItem3.title = @"item3";
    self.scrollViewItem4.title = @"item4";
    self.scrollViewItem1.backgroundColor = [UIColor redColor];
    self.scrollViewItem2.backgroundColor = [UIColor blueColor];
    self.scrollViewItem3.backgroundColor = [UIColor purpleColor];
    self.scrollViewItem4.backgroundColor = [UIColor greenColor];
    self.scrollView.items = @[self.scrollViewItem1,self.scrollViewItem2,self.scrollViewItem3,self.scrollViewItem4];
}
-(void) setFrameOrLayout{
    self.scrollView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
