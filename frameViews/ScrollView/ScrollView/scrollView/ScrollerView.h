//
//  ScrollerView.h
//  OrderManager
//
//  Created by apple on 2018/1/22.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScrollViewItem.h"

@interface ScrollerView : UIView <UIScrollViewDelegate>
@property(nonatomic,strong) NSArray<ScrollViewItem *> * items;

@end
