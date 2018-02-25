//
//  HDConllectionView.h
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDConllectionView : UICollectionView

+(instancetype) baseHeaderScollCollectionView;

/**
     头部的fix只支持iOS9及以上的，iOS8的无效

 @return <#return value description#>
 */
+(instancetype) baseHeaderFixCollectionView;

@end
