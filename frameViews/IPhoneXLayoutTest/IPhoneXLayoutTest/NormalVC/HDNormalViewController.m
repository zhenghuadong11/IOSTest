//
//  HDNormalViewController.m
//  IPhoneXLayoutTest
//
//  Created by 郑华栋 on 2018/3/13.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDNormalViewController.h"
#define KIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
@interface HDNormalViewController ()
@property(nonatomic,strong) UIImageView * nvc_backImageView;
@property(nonatomic,assign) BOOL nvc_isNotRefreshSafeViewFrame;
@property(nonatomic,assign) BOOL nvc_isNotRefreshFrame;
@end

@implementation HDNormalViewController


-(UIView *)safeContentView{
    if (_safeContentView == nil) {
        _safeContentView = [[UIView alloc] init];
        [self.view addSubview:_safeContentView];
        _safeContentView.backgroundColor = [UIColor whiteColor];
    }
    return _safeContentView;
    
}
-(UIImageView *)nvc_backImageView{
    if (_nvc_backImageView == nil) {
        _nvc_backImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_nvc_backImageView];
    }
    return _nvc_backImageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.safeContentView.frame = self.view.bounds;
}
/**
  iphoneX时有状态栏比较好看
 */
-(BOOL)prefersStatusBarHidden{
    if (KIsiPhoneX) {
        return false;
    }
    return true;
}



- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
-(void)setBackGroundColorForLiuhai:(UIColor *)color{
    self.view.backgroundColor = color;
}

-(void)setBackGroundImage:(UIImage *)image{
    self.nvc_backImageView.image = image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 安全区域改变时调用
 */
-(void)viewSafeAreaInsetsDidChange{
    [super viewSafeAreaInsetsDidChange];
    static int a =0;
    NSLog(@"safeView次数：%d",a);
    a += 1;
    CGFloat x = self.view.safeAreaInsets.left;
    CGFloat y = self.view.safeAreaInsets.top;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - x - self.view.safeAreaInsets.right;
    CGFloat height = [UIScreen mainScreen].bounds.size.height - y - self.view.safeAreaInsets.bottom;
    
    self.nvc_isNotRefreshSafeViewFrame = true;
    self.safeContentView.frame = CGRectMake(x, y, width, height);;
    
}

/**
 屏幕转动时调用
 */
-(void)viewDidLayoutSubviews{
    
    if (self.nvc_isNotRefreshSafeViewFrame == false) {
        
        if (@available(iOS 11.0, *)) {
            [self viewSafeAreaInsetsDidChange];
        } else {

            if (self.navigationController == nil || self.navigationController.navigationBarHidden == true ||
                self.navigationController.navigationBar.alpha == 0) {
                
                CGFloat statusHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
                
                self.safeContentView.frame = CGRectMake(0, statusHeight, self.view.frame.size.width, self.view.frame.size.height - statusHeight);
            }else{
                CGFloat topHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height;
                self.safeContentView.frame = CGRectMake(0, topHeight, self.view.frame.size.width, self.view.frame.size.height - topHeight);
                
            }
        }
    }
    
    if (self.nvc_isNotRefreshFrame == false) {
        [self setFrameOrLayout];
    }
    
    self.nvc_isNotRefreshSafeViewFrame = false;
    self.nvc_isNotRefreshFrame = false;

}

/**
 设置视图大小和位置
 */
-(void) setFrameOrLayout{
    static int af = 0;
    NSLog(@"frame调用次数：%d",af);
    af += 1;
    self.nvc_isNotRefreshFrame = true;
}


@end
