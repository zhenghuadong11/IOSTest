//
//  Macro_Notification.m
//  LiveGuard
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HDMacro_Notification.h"
static HDMacro_Notification * _share;

@implementation HDMacro_Notification

+(instancetype)share{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _share = [[HDMacro_Notification alloc] init];
    });
    return _share;
}
-(instancetype)init{
    if (self = [super init]) {
        self.deviceTokenGet = @"deviceTokenGet";
        self.remoteNotification = @"remoteNotification";
        self.haveNotification = @"haveNotification";
        self.sendNotification = @"sendNotification";
    }
    return self;
}
@end
