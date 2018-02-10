//
//  DefaultMacro.m
//  BigHTML5
//
//  Created by apple on 17/9/7.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HDMacro_Default.h"

static HDMacro_Default * default_macro;
@implementation HDMacro_Default

+(instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        default_macro = [[self alloc] init];
    });
    return default_macro;
}


-(instancetype)init{
    self = [super init];
    if (self) {
        
        self.token = @"token";
        self.userName = @"userName";
        self.mobile = @"mobile";
//        @property(nonatomic,copy)NSString * user;
//        @property(nonatomic,copy)NSString * password;
        self.user = @"user";
        self.password = @"password";
    }
    return self;
}

@end
