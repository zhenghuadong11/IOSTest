//
//  HDCollectionReusableView.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDCollectionReusableView.h"

@interface HDCollectionReusableView()

@end


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

}
-(void) setDelegateOrClick{

}




-(void) setConfig{

}

-(void) setFrameOrLayout{

    
}
-(void)layoutSubviews{
    [self setFrameOrLayout];
}
@end
