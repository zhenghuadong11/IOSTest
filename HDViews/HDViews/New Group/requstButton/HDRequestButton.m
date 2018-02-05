//
//  HDRequestButton.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDRequestButton.h"

@implementation HDRequestButton
{
    UIColor * _color;
    NSString * _normalTest;
    NSString * _requestTest;
}

-(void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];

    if(_color == nil|| !CGColorEqualToColor([UIColor lightGrayColor].CGColor, backgroundColor.CGColor)){
        _color = backgroundColor;
    }
    
}
-(void)setNormalTest:(NSString *)normalTest requestTest:(NSString *)requestTest{
    [self setTitle:normalTest forState:(UIControlStateNormal)];
    _normalTest = normalTest;
    _requestTest = requestTest;
}
-(void)isRequesting:(BOOL)isRequesting{
    if (isRequesting) {
        self.backgroundColor = [UIColor lightGrayColor];
        self.userInteractionEnabled = false;
        [self setTitle:_requestTest forState:(UIControlStateNormal)];
    }else{
        self.backgroundColor = _color;
        
        self.userInteractionEnabled = true;
        [self setTitle:_normalTest forState:(UIControlStateNormal)];
    }
}

@end
