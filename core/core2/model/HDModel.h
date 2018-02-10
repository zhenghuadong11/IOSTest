//
//  CGTitle_Num_UnitModel.h
//  LiveGuard
//
//  Created by apple on 16/12/19.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface HDModel : NSObject
@property(nonatomic,copy) NSString * title;
@property(nonatomic,copy) NSString * num;
@property(nonatomic,copy) NSString * unit;
@property(nonatomic,strong) UIColor * color;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)modelWithDict:(NSDictionary *) dict;

@end
