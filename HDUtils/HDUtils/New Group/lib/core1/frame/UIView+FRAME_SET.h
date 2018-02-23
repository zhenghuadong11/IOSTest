//
//  UIView+FRAME_SET.h
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (FRAME_SET)


-(CGFloat) width;
-(CGFloat) height;
-(CGFloat) x;
-(CGFloat) y;
-(CGFloat) maxX;
-(CGFloat) maxY;
-(CGSize) size;
-(CGPoint) origin;


-(void) setWidth:(CGFloat) width;
-(void) setHeight:(CGFloat) height;
-(void) setX:(CGFloat) x;
-(void) setY:(CGFloat) y;
-(void) setMaxX:(CGFloat) x;
-(void) setMaxY:(CGFloat) y;
-(void) setSize:(CGSize) size;
-(void) setOrigin:(CGPoint) origin;



@end
