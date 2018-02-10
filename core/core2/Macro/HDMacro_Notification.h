//
//  Macro_Notification.h
//  LiveGuard
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 项目所有的通知的name都在这里，每个name应该有很好的标示
 */
@interface HDMacro_Notification : NSObject
+(instancetype) share;

@property(nonatomic,copy) NSString * deviceTokenGet;
@property(nonatomic,copy) NSString * remoteNotification;
@property(nonatomic,copy) NSString * haveNotification;
@property(nonatomic,copy) NSString * sendNotification;
@end
