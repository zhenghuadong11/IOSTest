//
//  HDAnimationModel.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/22.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDAnimationModel.h"

@implementation HDAnimationModel
-(instancetype)init{
    
    if (self = [super init]) {
        self.stiffness = 100;
        self.damping = 10;
        self.endProgress = 1;
    }
    return self;

}
@end
