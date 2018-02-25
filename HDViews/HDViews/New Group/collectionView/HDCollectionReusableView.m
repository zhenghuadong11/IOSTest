//
//  HDCollectionReusableView.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDCollectionReusableView.h"
#import "HDDefault.h"
//#import "HDClickButton.h"
@interface HDCollectionReusableView()
@property(nonatomic,strong) UIView * backView;
@property(nonatomic,strong) UIButton * leftButton;
@property(nonatomic,strong) UIButton * rightButton;
@property(nonatomic,assign) BOOL isRight;
@end

#define SelectColor [UIColor colorWithHexString:@"#4e8bf9"]
#define UnSelectColor [UIColor colorWithHexString:@"#ffffff"]

#define SelectTextColor [UIColor colorWithHexString:@"#ffffff"]
#define UnSelectTextColor [UIColor grayColor]
@implementation HDCollectionReusableView

-(instancetype)init{
    if (self = [super initWithFrame:CGRectZero]) {
    }
    
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setDefault];
        [self setSubViews];
        [self setConfig];
        [self setDelegateOrClick];
        
    }
    return self;
}
-(void) setDefault{
    
}
-(void) setSubViews{
    self.backView = [[UIView alloc] init];
    self.leftButton = [[UIButton alloc] init];
    self.rightButton = [[UIButton alloc] init];
    
    [self addSubview:self.backView];
    [self.backView addSubview:self.leftButton];
    [self.backView addSubview:self.rightButton];
}
-(void) setDelegateOrClick{
    [self becomeSelectView:self.leftButton];
    [self becomeUnselectView:self.rightButton];
//    WEAK_SELFINIT;
//    self.leftButton.block = ^{
//        [weakSelf leftClick];
//    };
//    self.rightButton.block = ^{
//        [weakSelf rightClick];
//    };

    [self.leftButton addTarget:self action:@selector(leftClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.rightButton addTarget:self action:@selector(rightClick) forControlEvents:(UIControlEventTouchUpInside)];
}
-(void) becomeSelectView:(UIButton *)button{
    button.backgroundColor = SelectColor;
    [button setTitleColor:SelectTextColor forState:(UIControlStateNormal)];
    
}
-(void) becomeUnselectView:(UIButton *) button{
    button.backgroundColor = UnSelectColor;
    [button setTitleColor:UnSelectTextColor forState:(UIControlStateNormal)];
}

-(void) leftClick{
    
    if (self.isRight == false) {
        return;
    }
    [self.delegate collectionReusableView:self click:0];
    
    self.isRight = false;
    [self becomeSelectView:self.leftButton];
    [self becomeUnselectView:self.rightButton];
}
-(void) rightClick{
    if (self.isRight == true) {
        return;
    }
    [self.delegate collectionReusableView:self click:1];
    
    self.isRight = true;
    [self becomeSelectView:self.rightButton];
    [self becomeUnselectView:self.leftButton];
}

-(void) setConfig{
    [self.leftButton setTitle:@"商品列表" forState:(UIControlStateNormal)];
    [self.rightButton setTitle:@"服务列表" forState:(UIControlStateNormal)];
    self.backgroundColor = [UIColor clearColor];
}

-(void) setFrameOrLayout{
    self.backView.layer.cornerRadius = self.height/2;
    self.backView.layer.masksToBounds = true;
    
    self.backView.frame = self.bounds;
    self.backView.x = 10;
    self.backView.width = self.width - 20;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.backView.width/2;
    CGFloat height = self.backView.height;
    self.leftButton.frame = Rect_DEFAULT;
    
    x = self.leftButton.maxX;
    self.rightButton.frame = Rect_DEFAULT;
    
}
-(void)layoutSubviews{
    [self setFrameOrLayout];
}
@end
