//
//  HDTipVC.h
//  TipTest
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDTipVC : NSObject
@property(nonatomic,copy) NSString * tipTitle;
@property(nonatomic,copy) NSString * message;
@property(nonatomic,copy) NSDictionary<NSString *,void(^)(void)> * actions;
-(void)showWith:(NSString *) buttonNames,...;
@end
