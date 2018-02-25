//
//  HDConllectionView.h
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 需要更加复杂的属性可以参考这个网站
 https://www.jianshu.com/p/1e2351eade8f
 */
@interface HDConllectionView : UICollectionView

+(instancetype) baseHeaderScollCollectionView;

/**
 头部的fix只支持iOS9及以上的，iOS8的无效
 
 @return <#return value description#>
 */
+(instancetype) baseHeaderFixCollectionView;
/**
     头部的fix只支持iOS9及以上的，iOS8的无效

 @return <#return value description#>
 */
+(instancetype) baseHeaderFixCollectionViewWithitemSpacing:(CGFloat)itemSpacing lineSpacing:(CGFloat)lineSpacing;

+(instancetype) baseHeaderScollCollectionViewWithitemSpacing:(CGFloat)itemSpacing lineSpacing:(CGFloat)lineSpacing;

@end
