//
//  HDConllectionView.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDConllectionView.h"

@implementation HDConllectionView

+(instancetype)baseHeaderScollCollectionView{
    return [[self alloc] initBaseCollectionView:true];
}
+(instancetype)baseHeaderFixCollectionView{
    return [[self alloc] initBaseCollectionView:false];
}

-(instancetype) initBaseCollectionView:(BOOL) isScroll{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    if (@available(iOS 9.0, *)) {
        if (!isScroll) {
            flowLayout.sectionHeadersPinToVisibleBounds = true;
        }
        
    } else {
       
    }

    if (self = [super initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout]) {
        
    }
    return self;
}
+(instancetype)baseHeaderFixCollectionViewWithitemSpacing:(CGFloat)itemSpacing lineSpacing:(CGFloat)lineSpacing{
       return [[self alloc] initBaseCollectionView:false itemSpacing:itemSpacing lineSpacing:lineSpacing];
}
+(instancetype)baseHeaderScollCollectionViewWithitemSpacing:(CGFloat)itemSpacing lineSpacing:(CGFloat)lineSpacing{
   return [[self alloc] initBaseCollectionView:true itemSpacing:itemSpacing lineSpacing:lineSpacing];
}
-(instancetype) initBaseCollectionView:(BOOL) isScroll itemSpacing:(CGFloat) itemSpacing lineSpacing:(CGFloat)lineSpacing{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumInteritemSpacing = itemSpacing;
    flowLayout.minimumLineSpacing = lineSpacing;
    if (@available(iOS 9.0, *)) {
        if (!isScroll) {
            flowLayout.sectionHeadersPinToVisibleBounds = true;
        }
        
    } else {
        
    }
    
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout]) {
        
    }
    return self;
}
@end
