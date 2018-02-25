//
//  HDImageView.h
//  HDButtonTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
//    默认是width，保证图片不变形，如果需要变形，用None
    HDImageViewImageSizeStyle_Width,
    HDImageViewImageSizeStyle_Height,
    HDImageViewImageSizeStyle_None
    
} HDImageViewImageSizeStyle;

@interface HDImageView : UIImageView

@property(nonatomic,assign) HDImageViewImageSizeStyle imageSizeStyle;
@property(nonatomic,copy) NSString * imageUrl;
@property(nonatomic,assign) CGFloat maxImageWidth;
@property(nonatomic,assign) CGFloat maxImageHeight;
//@property(nonatomic,strong) ;
@end
