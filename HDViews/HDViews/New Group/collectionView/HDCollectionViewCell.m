//
//  HDCollectionViewCell.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDCollectionViewCell.h"
#import "HDDefault.h"
@interface HDCollectionViewCell()
@property(nonatomic,strong) UIImageView * imageView;
@property(nonatomic,strong) UILabel * titleLb;
@property(nonatomic,strong) UILabel * moneyLb;

@end

@implementation HDCollectionViewCell
-(instancetype)init{
    if (self = [super initWithFrame:CGRectZero]) {

    }
    return self;

}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setDefault];
        [self setSubViews];
        [self setConfig];
        [self setDelegateOrClick];
        [self setFrameOrLayout];
    }
    return self;
}

-(void) setDefault{
    
}
-(void) setSubViews{
    self.imageView = [[UIImageView alloc] init];
    self.titleLb = [[UILabel alloc] init];
    self.moneyLb = [[UILabel alloc] init];
 
    
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.titleLb];
    [self.contentView addSubview:self.moneyLb];
}

-(void) setDelegateOrClick{
    
}
-(void) setConfig{
    self.backgroundColor = [UIColor whiteColor];
}

-(void)setModel:(THOrderModel *)model{
    if (model.imageUrl == nil) {
        self.imageView.image = [UIImage imageNamed:@"mao"];
    }else{
        
    }
    self.titleLb.text = model.title;
    self.moneyLb.text = [NSString stringWithFormat:@"¥%.0f",model.money];
}

-(void) setFrameOrLayout{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.width;
    CGFloat height = Layout_675_y(346);
    self.imageView.frame = Rect_DEFAULT;
    
    y = self.imageView.maxY;
    height = Layout_675_y(60);
    self.titleLb.frame = Rect_DEFAULT;
    y = self.titleLb.maxY;
    height = Layout_675_y(60);
    self.moneyLb.frame = Rect_DEFAULT;
    
}
-(void)layoutSubviews{
    [self setFrameOrLayout];
}
@end
