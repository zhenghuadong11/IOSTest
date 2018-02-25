//
//  THOrderModel.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "THOrderModel.h"

@implementation THOrderModel
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super initWithDict:dict]) {
        self.title = dict[@"title"];
        self.imageUrl = dict[@"imageUrl"];
        self.money = [dict[@"money"] floatValue];
    }
    return self;
}
@end
