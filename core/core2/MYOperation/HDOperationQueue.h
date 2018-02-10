//
//  MYOperationQueue.h
//  TaiHeFinanceApp
//
//  Created by apple on 16/11/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDOperationQueue : NSOperationQueue

+(instancetype)shareInstall;

-(void) addAaynBlock:(void(^)(void)) asynBlock afterMainBlock:(void(^)(void)) mainBlock;

+(void) waitMainBlock:(void(^)(void)) block for:(NSTimeInterval)time;
+(void) waitAsynBlock:(void(^)(void)) block for:(NSTimeInterval)time; 
@end
