//
//  HDPassWordView.h
//  PassWordViewTest
//
//  Created by 郑华栋 on 2018/2/23.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HDPassWordView;
@protocol HDPassWordViewDelegate

-(void) passWordView:(HDPassWordView *) view password:(NSString *) password;

@end

@interface HDPassWordView : UIView

@property(nonatomic,assign) BOOL isNeedBack;
@property(nonatomic,weak) id<HDPassWordViewDelegate> delegate;
@property(nonatomic,assign) NSInteger num;
-(void) moveToView:(UIView *) view;
-(void) hiddenView;

/**
 建议只用这个
 */
-(void) troggleView:(UIView *) view;
@end
