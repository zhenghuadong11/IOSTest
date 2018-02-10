//
//  NSString+Normal.m
//  HDFrameCoreShow
//
//  Created by apple on 2018/1/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NSString+Normal.h"

@implementation NSString (Normal)
-(NSString *)getNewUrlString{
    
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
}
@end
