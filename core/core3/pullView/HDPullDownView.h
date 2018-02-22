//
//  HDPullDownView.h
//  HDViews
//
//  Created by apple on 2018/2/8.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDPullDownView;
@protocol HDPullDownViewDelegate<NSObject>
-(void) pullDownView:(HDPullDownView *) view clickIndex:(NSInteger) index;
@end


@interface HDPullDownView : UIScrollView

/*
 *  items接受图片和文字，统一放中间
 */
@property(nonatomic,copy)NSArray<NSObject *> * items;
///* 总高度 默认130*/
//@property(nonatomic,assign) CGFloat height;

/* item的高度 默认40*/
@property(nonatomic,assign) CGFloat itemHeight;
@property(nonatomic,weak) id<HDPullDownViewDelegate> delegate;
/*
 *   宽度由view来决定，高度默认130，可以设置
 */
@property(nonatomic,assign) CGFloat originHeight;

-(void) troggleToView:(UIView *) view parentView:(UIView *) parentView;


@end
