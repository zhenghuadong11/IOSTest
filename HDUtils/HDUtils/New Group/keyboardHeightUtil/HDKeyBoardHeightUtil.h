//
//  HDKeyBoardHeightUtil.h
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HDKeyBoardHeightUtil;
@protocol HDKeyBoardHeightUtilDelegate<NSObject>
-(void) keyBoardHeightUtil:(HDKeyBoardHeightUtil *) util showHeight:(CGFloat) height;
-(void) keyBoardHeightUtilHidden:(HDKeyBoardHeightUtil *) util;
@end
@interface HDKeyBoardHeightUtil : NSObject
@property(nonatomic,weak) id<HDKeyBoardHeightUtilDelegate> delegate;
@end
