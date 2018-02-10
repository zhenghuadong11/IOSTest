//
//  Http_Macro.m
//  TaiHeFinanceApp
//
//  Created by apple on 16/12/2.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HDMacro_Http.h"

static HDMacro_Http * http_macro;
@implementation HDMacro_Http

+(instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        http_macro = [[self alloc] init];
    });
    return http_macro;
}


-(instancetype)init{
    self = [super init];
    if (self) {
        self.login = @"usercenter/app/user/login";
        self.apps = @"usercenter/app/appModule/permissions";
        self.notice = @"usercenter/app/notice";
        self.logout = @"usercenter/app/user/logout";
        self.editPassword = @"usercenter/app/user/editPassword";
        self.getBackPassword = @"usercenter/app/user/getBackPassword";
        self.sendMessage = @"usercenter/api/sms/sendMessage";
    }
    return self;
}

@end
