//
//  Macro_Image.m
//  LiveGuard
//
//  Created by zhenghuadong on 16/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "HDMacro_Image.h"
static HDMacro_Image * macro;
@implementation HDMacro_Image
+(instancetype)share{
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        macro = [[HDMacro_Image alloc] init];
    });
    return macro;
}

-(instancetype)init{
    if (self = [super init]) {
        self.login_back = @"login_back";
        self.logo = @"logo";
//        self.password = @"password";
        self.user = @"user";
        self.appIcon1 = @"appIcon1";
        self.appIcon2 = @"appIcon2";
        self.appIcon3 = @"appIcon3";
         self.appIcon4 = @"appIcon4";
        self.RichScan = @"RichScan";
        self.setting = @"setting";
        self.sign = @"sign";
        self.message = @"message";
        self.tip = @"tip";
        self.sup_toLast = @"sup_toLast";
        self.sup_bg = @"sup_bg";
        self.sup_back = @"sup_back";
        self.icon_back = @"icon_back";
        self.icon_phone = @"icon_phone";
        self.icon_lock = @"icon_lock";
        self.icon_number = @"icon_number";
        self.icon_to = @"icon_to";
        
        self.haveLook = @"haveLook";
        self.noLook = @"noLook";
        self.orderIcon = @"orderIcon";
        self.closeIcon = @"closeIcon";
        self.selectIcon = @"selectIcon";
        self.trail = @"trail";
        
        self.more = @"more";
        self.sounds = @"sounds";
    }
    return self;
}
@end
