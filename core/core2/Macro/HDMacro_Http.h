//
//  Http_Macro.h
//  TaiHeFinanceApp
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 所有的请求路径都写在这里，方便找
 */
@interface HDMacro_Http : NSObject

+(instancetype) share;



@property(nonatomic,copy)NSString * login;
@property(nonatomic,copy)NSString * apps;
@property(nonatomic,copy)NSString * notice;
@property(nonatomic,copy)NSString * logout;
@property(nonatomic,copy)NSString * editPassword;
@property(nonatomic,copy)NSString * getBackPassword;
@property(nonatomic,copy)NSString * sendMessage;
@end
