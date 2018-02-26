//
//  ScrollerView.m
//  OrderManager
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ScrollerView.h"
#import "HDDefault.h"
@implementation ScrollerView
{
    UIScrollView * _titleView;
    UIScrollView * _scrollView;
    
    NSMutableArray<UIView *>  * _titleContentViews;
    
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
    _titleView = [[UIScrollView alloc] init];
    _scrollView = [[UIScrollView alloc] init];
    _scrollUnderLineView = [[UIView alloc] init];
    
    
    [self addSubview:_titleView];
    [self addSubview:_scrollView];
    [_titleView addSubview:_scrollUnderLineView];
}
-(void) setUIConfig{
    _titleView.backgroundColor = [UIColor whiteColor];
    _scrollUnderLineView.backgroundColor = [UIColor colorWithHexString:@"#4e8af9"];
    _scrollView.pagingEnabled = true;
    _scrollView.bounces = false;
    _titleView.showsHorizontalScrollIndicator = false;
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
    y = _titleView.maxY;
    height = self.height - _titleView.height;
    width = self.width;
    _scrollView.backgroundColor = [UIColor greenColor];
    _scrollView.frame = Rect_DEFAULT;
    
    if (_titleContentViews.count != 0) {
        width = self.width/_titleContentViews.count;
    }
    
    
    if (width < self.itemMinWidth) {
        width = self.itemMinWidth;
    }
    for (NSInteger index = 0; index < _titleContentViews.count; index += 1) {
        y = 0;
        x = index * width;
        height = 41;
        _titleContentViews[index].frame = Rect_DEFAULT;
    }
    _titleView.contentSize = CGSizeMake(width * _titleContentViews.count,_titleView.height);
    
    
    x = 0;
    height = 2;
    y = _titleView.height - height;
    
    
    _scrollUnderLineView.frame = Rect_DEFAULT;
    
    
    for (NSInteger index = 0; index < self.items.count; index += 1) {
        x = self.width * index;
        y = 0;
        width = self.width;
        height = _scrollView.height;
        
        self.items[index].frame = Rect_DEFAULT;
    }
  
    [_scrollView setContentSize:CGSizeMake(self.width * self.items.count, self.height - 41)];
    
}


-(void)layoutSubviews{
    [self setFrameOrLayout];
}

-(void)setItems:(NSArray<ScrollViewItem *> *)items{
    _titleContentViews = [NSMutableArray array];
    _items = items;
    _itemsNum = items.count;
    for (NSInteger index = 0; index < items.count; index += 1) {
        UIButton * button = [[UIButton alloc] init];
        [button setTitle:items[index].title forState:(UIControlStateNormal)];

        
        [button setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor colorWithHexString:@"#4e8af9"] forState:(UIControlStateSelected)];

        button.tag = index;

        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [_titleContentViews addObject:button];
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
    _scrollUnderLineView.x = (scrollView.contentOffset.x/self.width) * _titleContentViews.firstObject.width;
    if (_titleView.contentOffset.x + self.width < _scrollUnderLineView.maxX) {
        CGPoint point = _titleView.contentOffset;
        point.x = _scrollUnderLineView.maxX - self.width;
        _titleView.contentOffset = point;
    }
    if (_titleView.contentOffset.x  > _scrollUnderLineView.x ) {
        CGPoint point = _titleView.contentOffset;
        point.x = _scrollUnderLineView.x;
        _titleView.contentOffset = point;
    }
    
    NSInteger pageNum = (NSInteger)(scrollView.contentOffset.x/self.width + 0.5);
    [self buttonInScroll:(UIButton *)_titleContentViews[pageNum]];
}



@end
