//
//  HDImageView.m
//  HDButtonTest
//
//  Created by 郑华栋 on 2018/2/25.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDImageView.h"
#import "HDDefault.h"
#import "NSString+Normal.h"
@implementation HDImageView
#pragma mark --  调整ImageView的size，防止图片变形
-(void)setImage:(UIImage *)image{
    [super setImage:image];
    [self sizeForImage];
}
-(void) sizeForImage{
    if (self.image != nil) {
        switch (self.imageSizeStyle) {
            case HDImageViewImageSizeStyle_Width:
            {
                
                self.height = self.image.size.height * self.width / self.image.size.width;
                
            }
            break;
            case HDImageViewImageSizeStyle_Height:
            {
                self.width = self.image.size.width * self.height / self.image.size.height;
                
            }
            break;
            default:
                return;
                break;
        }
    
        
        if (self.maxImageWidth == 0) {
            self.maxImageWidth = self.width;
        }
        if (self.maxImageHeight == 0) {
            self.maxImageHeight = self.height;
        }
        if (self.width > self.maxImageWidth) {
            self.width = self.maxImageWidth;
            self.height = self.image.size.height * self.width / self.image.size.width;
        }
        if (self.height > self.maxImageHeight) {
            self.height = self.maxImageHeight;
            self.width = self.image.size.width * self.height / self.image.size.height;
        }
        
    }
}
-(void)setMaxImageWidth:(CGFloat)maxImageWidth{
    _maxImageWidth = maxImageWidth;
    [self sizeForImage];
}
-(void)setMaxImageHeight:(CGFloat)maxImageHeight{
    _maxImageHeight = maxImageHeight;
    [self sizeForImage];
}

//-(void)setFrame:(CGRect)frame{
//    [super setFrame:frame];
//    [self sizeForImage];
//}
-(void)setImageSizeStyle:(HDImageViewImageSizeStyle)imageSizeStyle{
    _imageSizeStyle = imageSizeStyle;
    [self sizeForImage];
}

#pragma mark --  faa
-(void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    [[[NSURLSession sharedSession] downloadTaskWithURL:[NSURL URLWithString:[imageUrl getNewUrlString]] completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (location != nil) {
            UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = image;
            });
        }
       
        
    }] resume];
    
}

@end
