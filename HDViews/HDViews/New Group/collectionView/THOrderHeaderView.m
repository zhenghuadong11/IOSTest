//
//  THOrderHeaderView.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "THOrderHeaderView.h"
#import "HDDefault.h"
@implementation THOrderHeaderView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setDefault];
    [self setSubViews];
    [self setConfig];
    [self setDelegateOrClick];
}

-(void) setDefault{
    
}
-(void) setSubViews{
    
}
-(void) setDelegateOrClick{
    
}
-(void) setConfig{
    self.backView.layer.borderWidth = 1;
    self.backView.layer.borderColor = [[UIColor grayColor] CGColor];
}
-(void) setFrameOrLayout{
    self.backView.x = 15;
    self.backView.width = SCREEN_W - 30;
}
-(void)layoutSubviews{
    [self setFrameOrLayout];
}
@end
