//
//  HDPullDownView.m
//  HDViews
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDPullDownView.h"
#import "THDefault.h"
@implementation HDPullDownView
{
    BOOL _isShow;
    NSMutableArray<UIView *> * _pullSubViews;
}
-(instancetype)init{
    if (self = [super init]) {
        self.originHeight = 260;
        self.itemHeight = 40;
        _isShow = true;
        [self setUIConfig];
    }
    return self;
}

-(void) setUIConfig{
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    
}
-(void)setOriginHeight:(CGFloat)originHeight{
    _originHeight = originHeight;
    [self setFrameOrLayout];
}
-(void)setItems:(NSArray<NSObject *> *)items{
    _items = items;
    NSInteger itemNum = items.count;
    for (UIView * view in _pullSubViews) {
        [view removeFromSuperview];
    }
    _pullSubViews = [NSMutableArray array];
    
    
    for (NSInteger index = 0; index < itemNum; index += 1) {
        
        if ([items[index] isKindOfClass:[NSString class]]) {
            UIButton * label = [[UIButton alloc] init];
            [label setTitle:(NSString *)items[index] forState:(UIControlStateNormal)];
            label.tag = index;
            [label setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            [label addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:label];
            [_pullSubViews addObject:label];
        }else if([items[index] isKindOfClass:[UIImage class]]){
            UIButton * imageBtn = [[UIButton alloc] init];
            [imageBtn setImage:(UIImage *) items[index]  forState:(UIControlStateNormal)];
            imageBtn.tag = index;
            [imageBtn addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:imageBtn];
            [_pullSubViews addObject:imageBtn];
        }
        
    }
    
    
    [self setFrameOrLayout];
}
-(void)troggleToView:(UIView *)view parentView:(UIView *) parentView{
    if (_isShow) {
        _isShow = false;
        CGPoint converPoint = [view convertPoint:CGPointMake(0,view.height) toView:parentView];
        
        MYLog(@"view frame %@",NSStringFromCGRect(view.frame));
        MYLog(@"converPoint %@",NSStringFromCGPoint(converPoint));
        
        
        
        self.x = converPoint.x;
        self.y = converPoint.y;
        self.width = view.width;
        //    self.backgroundColor = [UIColor blueColor];
        if (self.superview == nil) {
            [parentView addSubview:self];
        }
        
        [self setFrameOrLayout];
        CGFloat height = self.height;
       
        
        
        self.height = 0;
        [UIView animateWithDuration:0.3 animations:^{
            self.height = height;
        } completion:nil];
    }else{
        [self close];
    }
    
    
    
}

-(void) buttonClick:(UIButton *) button{
    [self.delegate pullDownView:self clickIndex:button.tag];
    [self close];
}
-(void) close{
    [UIView animateWithDuration:0.3 animations:^{
        self.height = 0;
    } completion:nil];
    _isShow = true;
}

-(void)setItemHeight:(CGFloat)itemHeight{
    _itemHeight = itemHeight;
    [self setFrameOrLayout];
}

-(void)setFrameOrLayout{
    
    if (self.items.count * self.itemHeight < self.originHeight && self.items != nil) {
        self.height = self.items.count * self.itemHeight;
    }else{
        self.height = self.originHeight;
    }


    
    
    CGFloat contentHeight = self.itemHeight * self.items.count;
    CGFloat contentWidth = self.width;
    if (contentHeight < self.height) {
        self.height = contentHeight;
    }
    
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.width;
    CGFloat height = self.itemHeight;
    
    for (UIView * view in self.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            view.frame = Rect_DEFAULT;
            y += height;
            
        }
    }
    self.contentSize = CGSizeMake(contentWidth, contentHeight);
    
}


@end

