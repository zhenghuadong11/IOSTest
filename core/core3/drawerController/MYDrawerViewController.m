//
//  MYDrawerViewController.m
//  DrawerController
//
//  Created by zhenghuadong on 16/12/15.
//  Copyright © 2016年 zhenghuadong. All rights reserved.
//

#import "MYDrawerViewController.h"
#import "UIView+FRAME_SET.h"
@interface MYDrawerViewController ()

@end

@implementation MYDrawerViewController
{
    UIView * _midView;   //主要用于蒙板
    UIViewController * _drawController;
    UIViewController * _mainController;
  
    UIView * _drawView;
    UIView * _mainView;
    
    NSString * _status;   //中间和左边两种状态
    
    CGFloat _slideScale;  //滑动的位置
    
    CGFloat _drawViewWitdh;    //这个是开始的view的宽度，后面加了滑动的位置的宽度
    
    CGFloat _maxAlpheNum;
    
    CGFloat _endAnimateTime;  //动画的时间
    
    __block MYDrawerViewController * s;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    s = self;
//    self.view.backgroundColor = [UIColor grayColor];
    _slideScale = 20;
    _status = @"中间";
    _maxAlpheNum = 0.3;
    _endAnimateTime = 0.5;
}

-(void)setLeftDrawController:(UIViewController *)drawController andMainController:(UIViewController *)mainController{
    
    [self addChildViewController:drawController];
    [self addChildViewController:mainController];
    
    _drawController = drawController;
    _mainController = mainController;
    
    _drawView = _drawController.view;
    _mainView = _mainController.view;
    
    [self setSubViews];
    [self setUIConfig];
    [self setFrameOrLayout];
    [self setDelegateOrClick];
}

-(void) setSubViews{
    _midView = [[UIView alloc] init];
    [self.view addSubview:_mainView];
    [self.view addSubview:_midView];
    [self.view addSubview:_drawView];
    
//    _mainView.layer.shouldRasterize = true;
//    _midView.layer.shouldRasterize = true;
    _drawView.layer.shouldRasterize = true;
    _drawView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    
}

-(void) setUIConfig{
    _midView.backgroundColor = [UIColor blackColor];
    
}

-(void) setFrameOrLayout{
    _drawViewWitdh = _drawView.width;
    
    self.view.x = -1 * _drawView.width;

    
    CGFloat viewWidth = self.view.width;
    /**
     * 这里会将自控制器的View也会改变同样的宽度
     */
    self.view.width = _mainView.width + _drawView.width;
    self.view.height = _mainView.height > _drawView.height ? _mainView.height : _drawView.height;
 
    
    _drawView.width -= (self.view.width - viewWidth);
    _mainView.width -= (self.view.width - viewWidth);
    
    _midView.frame = self.view.bounds;
    _midView.alpha = 0;
    
    _mainView.x = _drawView.width;
    _drawView.width += _slideScale;
    
}

-(void) setDelegateOrClick{
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureStart:)];
    [_drawView addGestureRecognizer:pan];
    
    UITapGestureRecognizer * midViewTag = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(midViewTapGestureClick:)];
    [_midView addGestureRecognizer:midViewTag];
    
    UIPanGestureRecognizer * pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureStart:)];
    [_midView addGestureRecognizer:pan1];
    
}
-(void) midViewTapGestureClick:(UITapGestureRecognizer *)tap{
    
    
    [UIView animateWithDuration:_endAnimateTime animations:^{
        s.view.x = -1 * _drawViewWitdh;
        _midView.alpha = 0;
    }];
}

-(void) panGestureStart:(UIPanGestureRecognizer *)paramSender{
    CGPoint point = [paramSender translationInView:self.view];
    switch (paramSender.state) {
        case UIGestureRecognizerStateEnded:
        {
            if (self.view.x + point.x + _drawViewWitdh/2 > 0) {
                 [UIView animateWithDuration:_endAnimateTime animations:^{
                     s.view.x = 0;
                 }];
            }else{
                [UIView animateWithDuration:_endAnimateTime animations:^{
                    s.view.x = -1 * _drawViewWitdh;
                    _midView.alpha = 0;
                }];
            }
            
        }
            break;
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:
        {
            
    
            
            if ((self.view.x < 0 && self.view.x > (_drawViewWitdh * (-1))) || (self.view.x >= 0 && point.x < 0) || (self.view.x <= (_drawViewWitdh * (-1)) && point.x > 0)) {
                
                if (self.view.x + point.x > 0) {
                    self.view.x = 0;
                }else if(self.view.x + point.x < (-1 * _drawViewWitdh)){
                    self.view.x = (_drawViewWitdh * (-1));
                }else{
                    self.view.x = self.view.x + point.x;
                }
                
                
                _midView.alpha = ((self.view.x + _drawViewWitdh)/_drawViewWitdh) * _maxAlpheNum;
            }
            
            [paramSender setTranslation:(CGPointMake(0, 0)) inView:paramSender.view];
        }
        default:
            break;
    }
    
}


#pragma mark leftDrawShow
-(void)leftDrawShow{
    [UIView animateWithDuration:_endAnimateTime animations:^{
        s.view.x = 0;
        _midView.alpha = _maxAlpheNum;
    }];
}

-(void)leftUnShow{
    s.view.x = -1 * _drawViewWitdh;
    _midView.alpha = 0;
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
