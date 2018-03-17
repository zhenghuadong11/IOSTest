//
//  ViewController.m
//  IPhoneXLayoutTest
//
//  Created by 郑华栋 on 2018/3/13.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property(nonatomic,strong) UIButton * button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //    [self setStatusBarBackgroundColor:[UIColor blueColor]];
    self.safeContentView.backgroundColor = [UIColor blueColor];
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor purpleColor];
    [self.safeContentView addSubview:button];
    self.button = button;
}

-(void) setFrameOrLayout{
    [super setFrameOrLayout];
    
    self.button.frame = CGRectMake(0,0, self.safeContentView.frame.size.width/2, 100);
    
}

@end
