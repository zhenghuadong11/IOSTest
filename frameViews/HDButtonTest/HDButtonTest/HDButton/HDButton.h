//
//  HDButton.h
//  HDButtonTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDImageView.h"
/**
 写这个的目的是使用一个全能的控件，代替UILabel，UIButton，UIView，UIImageView在项目中的使用
 以及对一些常用的需求能够更方便的实现
 坏处是在单独UIlabel，UIImageView的时候，等于多加了一层view；
 反正看具体情况使用吧，不想多加View的话另外会提供HDLabel，HDImageView，看需求使用。
 */
@interface HDButton : UIView


/**
 标题的label，本来只想有一个label，但是这种需求比较多，所以加一个，
 另外一个label表示内容label,如果不是需求需要，不建议使用这个label
 */
@property(nonatomic,strong) UILabel * titleLabel;

@property(nonatomic,strong) UIView * view;
@property(nonatomic,strong) UILabel * label;
@property(nonatomic,strong) HDImageView * imageView;
@property(nonatomic,strong) HDImageView * backImageView;



@property(nonatomic,assign) CGFloat maxImageWidth;   //默认是HDButton的宽度
@property(nonatomic,assign) CGFloat maxImageHeight;   //默认是HDButton的高度






@property(nonatomic,strong) void(^ viewBlock)(void);
@property(nonatomic,strong) void(^ labelBlock)(void);
@property(nonatomic,strong) void(^ imageViewBlock)(void);
@property(nonatomic,strong) void(^ selfBlock)(void);


#pragma mark --  设置选择状态的属性，暂时提供这些。根据具体需求添加完善
@property(nonatomic,copy) NSString * selectContext;
@property(nonatomic,copy) NSString * selectTitle;
@property(nonatomic,strong) UIColor * selectTitleColor;
@property(nonatomic,strong) UIColor * selectContentColor;
@property(nonatomic,strong) UIColor * selectBackColor;
@property(nonatomic,strong) UIImage * selectImage;
@property(nonatomic,strong) UIImage * selectBackImage;

@property(nonatomic,assign) BOOL isSelect;


-(void) hdSizeToFit;


@end
