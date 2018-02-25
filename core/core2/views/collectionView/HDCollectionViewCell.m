//
//  HDCollectionViewCell.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDCollectionViewCell.h"
@interface HDCollectionViewCell()


@end

@implementation HDCollectionViewCell
-(instancetype)init{
    if (self = [super initWithFrame:CGRectZero]) {

    }
    return self;

}

/**
 纯代码的在这里进入

 @param frame <#frame description#>
 @return <#return value description#>
 */
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
