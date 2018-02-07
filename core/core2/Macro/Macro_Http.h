//
//  Http_Macro.h
//  TaiHeFinanceApp
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Macro_Http : NSObject

+(instancetype) share;



@property(nonatomic,copy)NSString * login;
@property(nonatomic,copy)NSString * apps;
@property(nonatomic,copy)NSString * notice;
@property(nonatomic,copy)NSString * logout;
@property(nonatomic,copy)NSString * editPassword;
@property(nonatomic,copy)NSString * getBackPassword;
@property(nonatomic,copy)NSString * sendMessage;
@end
