//
//  UIView+FRAME_SET.m
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "UIView+FRAME_SET.h"

@implementation UIView (FRAME_SET)


-(CGFloat)width{
    return self.frame.size.width;
}
-(CGFloat)height{
    return self.frame.size.height;
}
-(CGFloat)x{
    return self.frame.origin.x;
}
-(CGFloat)y{
    return self.frame.origin.y;
}
-(CGFloat)maxX{
    return self.frame.origin.x + self.frame.size.width;
}
-(CGFloat)maxY{
    return self.frame.origin.y + self.frame.size.height;
}
-(CGSize)size{
    return self.frame.size;
}
-(CGPoint)origin{
    return self.frame.origin;
}

-(void)setX:(CGFloat)x{
   
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
 }

-(void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}

-(void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

-(void)setHeight:(CGFloat)height{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

-(void)setMaxX:(CGFloat)x{
    [self setX:x-[self width]];
}
-(void)setMaxY:(CGFloat)y{
    [self setY:y - [self height]];
}

-(void)setSize:(CGSize)size{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

-(void)setOrigin:(CGPoint)origin{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}


@end
