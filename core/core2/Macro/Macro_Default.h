//
//  DefaultMacro.h
//  BigHTML5
//
//  Created by apple on 17/9/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Macro_Default : NSObject
+(instancetype) share;

@property(nonatomic,copy)NSString * token;
@property(nonatomic,copy)NSString * userName;
@property(nonatomic,copy)NSString * mobile;


/*
 * 账号和密码
 */
@property(nonatomic,copy)NSString * user;
@property(nonatomic,copy)NSString * password;
@end
