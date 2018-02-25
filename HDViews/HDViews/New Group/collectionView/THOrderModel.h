//
//  THOrderModel.h
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HDModel.h"

@interface THOrderModel : HDModel
@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * imageUrl;
@property(nonatomic,assign) CGFloat money;

@end
