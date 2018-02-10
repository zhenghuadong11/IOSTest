//
//  CGAccount.m
//  LiveGuard
//
//  Created by apple on 17/2/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "HDAccount.h"
#import "MYDate.h"

static HDAccount * account;
@implementation HDAccount
+(instancetype)share{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        account = [[self alloc] init];
    });
    return account;
}

+(void)login:(NSDictionary *)resultBody{
    HDAccount * account = [HDAccount share];
//    [4]    (null)    @"userType" : (long)2
    account.userType = [resultBody[@"userType"] integerValue];
    account.ID = resultBody[@"id"];
    account.phoneNum = resultBody[@"phoneNumber"];
    account.name = resultBody[@"name"];
    account.genderId = resultBody[@"genderId"];
    account.gender = resultBody[@"gender"];
    
    account.idNumber = resultBody[@"idNumber"];
//    account.userType = resultBody[@"userType"];
    account.serviceProviderId = resultBody[@"serviceProviderId"];
    
    account.serviceProviderName = resultBody[@"serviceProviderName"];
    
    account.orgId = resultBody[@"orgId"];
    account.orgCode = resultBody[@"orgCode"];
    account.orgName = resultBody[@"orgName"];
}

@end
