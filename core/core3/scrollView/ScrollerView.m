//
//  ScrollerView.m
//  OrderManager
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ScrollerView.h"
//#import "HDunderLineButton.h"
#import "HDDefault.h"
@implementation ScrollerView
{
    UIView * _titleView;
    UIScrollView * _scrollView;
    
    UIButton * lastButton;
    UIView * _scrollUnderLineView;
    
    NSInteger _itemsNum;
}


-(instancetype)init{
    if (self = [super init]) {
        [self setSubViews];
        [self setUIConfig];
        [self setDelegateOrClick];
        [self setFrameOrLayout];
    }
    return self;
}

-(void) setSubViews{
    _titleView = [[UIView alloc] init];
    _scrollView = [[UIScrollView alloc] init];
    _scrollUnderLineView = [[UIView alloc] init];
    
    
    [self addSubview:_titleView];
    [self addSubview:_scrollView];
    [self addSubview:_scrollUnderLineView];
}
-(void) setUIConfig{
    _titleView.backgroundColor = [UIColor whiteColor];
    _scrollUnderLineView.backgroundColor = [UIColor colorWithHexString:@"#4e8af9"];
    _scrollView.pagingEnabled = true;
    _scrollView.bounces = false;
}
-(void) setDelegateOrClick{
    _scrollView.delegate = self;
}
-(void) setFrameOrLayout{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.width;
    CGFloat height = 41;
    _titleView.frame = Rect_DEFAULT;
    
    
    x = 0;
    y = _titleView.maxY - 2;
    if (self.items != nil) {
        width = self.width/self.items.count;
    }
    
    height = 2;
    _scrollUnderLineView.frame = Rect_DEFAULT;
    
    
    x = 0;
    y = _titleView.maxY;
    height = self.height - _titleView.height;
    width = self.width;
    _scrollView.backgroundColor = [UIColor greenColor];
    _scrollView.frame = Rect_DEFAULT;
    
    
    for (NSInteger index = 0; index < _titleView.subviews.count; index += 1) {
        y = 0;
        width = self.width/_titleView.subviews.count;
        x = index * width;
        height = 41;
        _titleView.subviews[index].frame = Rect_DEFAULT;
    }
    for (NSInteger index = 0; index < self.items.count; index += 1) {
        x = self.width * index;
        y = 0;
        width = self.width;
        height = _scrollView.height;
        
        self.items[index].frame = Rect_DEFAULT;
    }
    NSLog(@"%lf",self.width * self.items.count);
    [_scrollView setContentSize:CGSizeMake(self.width * self.items.count, self.height - 41)];
    
}


-(void)layoutSubviews{
    [self setFrameOrLayout];
}

-(void)setItems:(NSArray<ScrollViewItem *> *)items{
    
    _items = items;
    _itemsNum = items.count;
    for (NSInteger index = 0; index < items.count; index += 1) {
        UIButton * button = [[UIButton alloc] init];
        [button setTitle:items[index].title forState:(UIControlStateNormal)];

        
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor colorWithHexString:@"#4e8af9"] forState:(UIControlStateSelected)];
//        button.backgroundColor = [UIColor grayColor];
        button.tag = index;

        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        
        [_titleView addSubview:button];
        

        [_scrollView addSubview:items[index]];
        
        
    }
    
    
}
-(void) buttonClick:(UIButton *) button{
    if (lastButton != nil) {
        lastButton.selected = false;
    }
    
    button.selected = true;
    
    lastButton = button;
    
    [UIView animateWithDuration:0.25 animations:^{
        CGPoint point = _scrollView.contentOffset;
        point.x = button.tag * self.width;
        _scrollView.contentOffset = point;
    }];
}

-(void) buttonInScroll:(UIButton *) button{
    if (lastButton != nil) {
        lastButton.selected = false;
    }
    
    button.selected = true;
    
    lastButton = button;
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _scrollUnderLineView.x = scrollView.contentOffset.x/_itemsNum;
    NSInteger pageNum = (NSInteger)(scrollView.contentOffset.x/self.width + 0.5);
    [self buttonInScroll:_titleView.subviews[pageNum]];
}
//-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
//
//
//    NSInteger pageNum = (NSInteger)(scrollView.contentOffset.x/self.width + 0.5);
//
//    [UIView animateWithDuration:1 animations:^{
//        CGPoint point = scrollView.contentOffset;
//        point.x = pageNum * self.width;
//        scrollView.contentOffset = point;
//    }];
//
//    [self buttonClick:_titleView.subviews[pageNum]];
//}

//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    NSInteger pageNum = (NSInteger)(scrollView.contentOffset.x/self.width + 0.5);
//
//
//        CGPoint point = scrollView.contentOffset;
//        point.x = pageNum * self.width;
//        scrollView.contentOffset = point;
//
//
//    [self buttonClick:_titleView.subviews[pageNum]];
//}


@end
