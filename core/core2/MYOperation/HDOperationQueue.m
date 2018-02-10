//
//  MYOperationQueue.m
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "HDOperationQueue.h"

static HDOperationQueue * queue;
@implementation HDOperationQueue

+(instancetype) shareInstall{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        queue = [[HDOperationQueue alloc] init];
        queue.maxConcurrentOperationCount = 5;
    });
    return queue;
}

-(void)addAaynBlock:(void (^)(void))asynBlock afterMainBlock:(void (^)(void))mainBlock{
    
    NSBlockOperation * operation = [NSBlockOperation blockOperationWithBlock:^{
        
        asynBlock();
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (mainBlock != nil) {
                mainBlock();
            }
            
        }];
    }];
    [self addOperation:operation];
}

+(void)waitMainBlock:(void (^)(void))block for:(NSTimeInterval)time{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        block();
    });
}

+(void)waitAsynBlock:(void (^)(void))block for:(NSTimeInterval)time{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( time* NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
        block();
    });
}

@end
