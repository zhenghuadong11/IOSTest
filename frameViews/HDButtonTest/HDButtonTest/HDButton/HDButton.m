//
//  HDButton.m
//  HDButtonTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDButton.h"
#import "HDDefault.h"
@interface HDButton()
@property(nonatomic,copy) NSString * context;

@property(nonatomic,copy) NSString * title;

@property(nonatomic,strong) UIColor * titleColor;

@property(nonatomic,strong) UIColor * contentColor;

@property(nonatomic,strong) UIColor * backColor;

@property(nonatomic,strong) UIImage * image;

@property(nonatomic,strong) UIImage * backImage;

@end
@implementation HDButton
-(UIView *)view{
    if (_view == nil) {
        _view = [[UIView alloc] init];
        [self addSubview:_view];
    }
    return _view;
}
-(UILabel *)label{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
        [self addSubview:_label];
    }
    return _label;
}
-(UIImageView *)imageView{
    if (_imageView == nil) {
        _imageView = [[HDImageView alloc] init];
        [self addSubview:_imageView];
    }
    return _imageView;
}
-(UIImageView *)backImageView{
    if (_backImageView == nil) {
        _backImageView = [[HDImageView alloc] init];
        _backImageView.imageSizeStyle = HDImageViewImageSizeStyle_None;
         [self addSubview:_backImageView];
    }
    return _backImageView;
}

-(NSInteger) numOfView{
    NSInteger total = 0;
    total += (self.titleLabel == nil ? 1 : 0);
    total += (self.label == nil ? 1 : 0);
    total += (self.view == nil ? 1 : 0);
    total += (self.imageView == nil ? 1 : 0);
    return total;
}

-(void)setWidth:(CGFloat)width{
    
}
-(void)setHeight:(CGFloat)height{
    [self frame];
}



#pragma mark --  select状态的设置
-(void)setIsSelect:(BOOL)isSelect{

    if (_isSelect == false && isSelect == true) {
        if (self.title == nil) {
            self.title = self.titleLabel.text;
        }
        if (self.context == nil) {
            self.context = self.label.text;
        }
        if (self.titleColor == nil) {
            self.titleColor = self.titleLabel.textColor;
        }
        if (self.contentColor == nil) {
            self.contentColor  = self.label.textColor;
        }
        if (self.image == nil) {
            self.image = self.imageView.image;
        }
        if (self.backImage == nil) {
            self.backImage = self.backImageView.image;
        }
        if (self.backColor == nil) {
            self.backColor = self.backgroundColor;
        }

    }
    
    _isSelect = isSelect;

    
    if (isSelect == true) {
        if (self.selectContext != nil) {
            self.label.text = self.selectContext;
            [self.label sizeToFit];
        }
        if (self.selectTitle != nil) {
            self.titleLabel.text = self.selectTitle;
            [self.titleLabel sizeToFit];
        }
        if (self.selectTitleColor != nil) {
            self.titleLabel.textColor = self.selectTitleColor;
        }
        if (self.selectContentColor != nil) {
            self.label.textColor = self.selectContentColor;
        }
        if (self.selectBackColor != nil) {
            self.backgroundColor = self.selectBackColor;
        }
        if (self.selectImage != nil) {
            self.imageView.image = self.selectImage;
        }
        if (self.selectBackImage != nil) {
            self.backImageView.image = self.selectBackImage;
        }
    }else{
        if (self.context != nil) {
            self.label.text = self.context;
            [self.label sizeToFit];
        }
        if (self.title != nil) {
            self.titleLabel.text = self.title;
            [self.titleLabel sizeToFit];
        }
        if (self.titleColor != nil) {
            self.titleLabel.textColor = self.titleColor;
        }
        if (self.contentColor != nil) {
            self.label.textColor = self.contentColor;
        }
        if (self.backColor != nil) {
            self.backgroundColor = self.backColor;
        }
        if (self.image != nil) {
            self.imageView.image = self.image;
        }
        if (self.backImage != nil) {
            self.backImageView.image = self.backImage;
        }
    }
}






#pragma mark --  clickBlock
-(void)setViewBlock:(void (^)(void))viewBlock{
    _viewBlock = viewBlock;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self.view addGestureRecognizer:tap];
}
-(void)viewClick{
    if (self.viewBlock != nil) {
        self.viewBlock();
    }
}
-(void)setLabelBlock:(void (^)(void))labelBlock{
    _labelBlock = labelBlock;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick)];
    self.label.userInteractionEnabled = true;
    [self.label addGestureRecognizer:tap];
}
-(void)labelClick{
    if (self.labelBlock != nil) {
        self.labelBlock();
    }
}
-(void)setImageViewBlock:(void (^)(void))imageViewBlock{
    _imageViewBlock = imageViewBlock;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick)];
    self.imageView.userInteractionEnabled = true;
    [self.imageView addGestureRecognizer:tap];
}
-(void)imageViewClick{
    if (self.imageViewBlock != nil) {
        self.imageViewBlock();
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.selfBlock != nil) {
        self.selfBlock();
    }
}

-(void)hdSizeToFit{
    CGFloat width  = 0;
    CGFloat height = 0;
    for (UIView * view in self.subviews) {
        if (width < view.maxX) {
            width = view.maxX;
        }
        if (height < view.maxY) {
            height = view.maxY;
        }
    }
    self.width = width;
    self.height = height;
}
-(void)layoutSubviews{
    NSLog(@"layout");
}
@end
