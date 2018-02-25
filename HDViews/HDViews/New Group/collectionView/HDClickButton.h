//
//  HDClickButton.h
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDClickButton : UIButton
@property(nonatomic,strong) void(^ block)(void);

@end
