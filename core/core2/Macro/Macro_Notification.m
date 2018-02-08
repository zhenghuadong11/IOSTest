//
//  Macro_Notification.m
//  LiveGuard
//
//  Created by apple on 16/12/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Macro_Notification.h"
static Macro_Notification * _share;

@implementation Macro_Notification

+(instancetype)share{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _share = [[Macro_Notification alloc] init];
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
