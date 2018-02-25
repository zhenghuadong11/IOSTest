//
//  HDCollectionReusableView.h
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HDCollectionReusableView;
@protocol HDCollectionReusableViewDelegate
-(void) collectionReusableView:(HDCollectionReusableView *) view click:(NSInteger) index;
@end


@interface HDCollectionReusableView : UICollectionReusableView
@property(nonatomic,weak) id<HDCollectionReusableViewDelegate> delegate;
@end
