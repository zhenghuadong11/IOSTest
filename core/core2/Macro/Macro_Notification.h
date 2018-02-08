//
//  Macro_Notification.h
//  LiveGuard
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Macro_Notification : NSObject
+(instancetype) share;

@property(nonatomic,copy) NSString * deviceTokenGet;
@property(nonatomic,copy) NSString * remoteNotification;
@property(nonatomic,copy) NSString * haveNotification;
@property(nonatomic,copy) NSString * sendNotification;
@end
