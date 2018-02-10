//
//  CGAccount.h
//  LiveGuard
//
//  Created by apple on 17/2/18.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define mobile @"13737725231"
#define mobile @"18577038032"
//#define password @"111"
#define password @"123456"

/**
 账号的一些核心信息
 */
@interface HDAccount : NSObject
+(instancetype) share;

@property(nonatomic,copy) NSString * ID;
@property(nonatomic,copy) NSString * phoneNum;
@property(nonatomic,copy) NSString * name;
@property(nonatomic,copy) NSString * genderId;
@property(nonatomic,copy) NSString * gender;
@property(nonatomic,copy) NSString * idNumber;

@property(nonatomic,copy) NSString * serviceProviderId;
@property(nonatomic,copy) NSString * serviceProviderName;
@property(nonatomic,copy) NSString * orgId;
@property(nonatomic,copy) NSString * orgCode;
@property(nonatomic,copy) NSString * orgName;
@property(nonatomic,assign) NSInteger userType;    

+(void) login:(NSDictionary *) resultBody;
+(void) logout;

@end
