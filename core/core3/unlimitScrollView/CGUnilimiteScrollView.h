//
//  CGUnilimiteScrollView.h
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CGUnilimiteScrollView : UIView<UIScrollViewDelegate>

@property(nonnull,nonatomic,strong) NSMutableArray<UIImage *> * imageStrs;

@property(nonatomic,assign)NSInteger currentPage;

@property(nonatomic,copy,nullable)NSArray<NSURL *> * imageUrls;
@end
