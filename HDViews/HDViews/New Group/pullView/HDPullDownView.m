//
//  HDPullDownView.m
//  HDViews
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDPullDownView.h"
#import "HDDefault.h"
@implementation HDPullDownView

-(instancetype)init{
    if (self = [super init]) {
        self.height = 130;
        self.itemHeight = 40;
        [self setUIConfig];
    }
    return self;
}

-(void) setUIConfig{
    self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth = 1;
    
}

-(void)setItems:(NSArray<NSObject *> *)items{
    _items = items;
    NSInteger itemNum = items.count;
    
    for (NSInteger index = 0; index < itemNum; index += 1) {
        
        if ([items[index] isKindOfClass:[NSString class]]) {
            UIButton * label = [[UIButton alloc] init];
            [label setTitle:(NSString *)items[index] forState:(UIControlStateNormal)];
            label.tag = index;
            [label setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
            [label addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:label];
        }else if([items[index] isKindOfClass:[UIImage class]]){
            UIButton * imageBtn = [[UIButton alloc] init];
            [imageBtn setImage:(UIImage *) items[index]  forState:(UIControlStateNormal)];
            imageBtn.tag = index;
            [imageBtn addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:imageBtn];
        }
        
    }

    
    [self setFrameOrLayout];
}
-(void)showToView:(UIView *)view parentController:(UIViewController *)vc{
    CGPoint converPoint = [view convertPoint:CGPointMake(view.x, view.y+view.height) toView:vc.view];
    self.x = converPoint.x - view.x;
    self.y = converPoint.y - view.y;
    self.width = view.width;
//    self.backgroundColor = [UIColor blueColor];
    [vc.view addSubview:self];
    
    [self setFrameOrLayout];
}
-(void) buttonClick:(UIButton *) button{
    [self.delegate pullDownView:self clickIndex:button.tag];
    [self removeFromSuperview];
}


-(void)setItemHeight:(CGFloat)itemHeight{
    _itemHeight = itemHeight;
    [self setFrameOrLayout];
}

-(void)setFrameOrLayout{
    if (self.items.count * self.itemHeight < self.height && self.items != nil) {
        self.height = self.items.count * self.itemHeight;
    }
    
    
    CGFloat contentHeight = self.itemHeight * self.items.count;
    CGFloat contentWidth = self.width;
    
    
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
