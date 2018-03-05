//
//  HDTip.m
//  TipTest
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HDTip.h"

#define IS_MORE_THAN(x) ([[[UIDevice currentDevice] systemVersion] floatValue] > x)
#import <UIKit/UIKit.h>
@implementation HDTip
+(void)alertTipTitle:(NSString *)title message:(NSString *)message{
    if (IS_MORE_THAN(8.0)) {
        if (@available(iOS 8.0, *)) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertController addAction:cancelAction];
            
            [[self lastPresentVC] presentViewController:alertController animated:true completion:nil];
        } else {
            // Fallback on earlier versions
        }
    }else{
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
        [alertView show];
    }
}

+(UIViewController *) lastPresentVC{
    UIViewController * vc =  [UIApplication sharedApplication].keyWindow.rootViewController;
    while (vc.presentedViewController) {
        vc = [vc presentedViewController];
    }
    return vc;
}

+(void)alertTipTitle:(NSString *)title message:(NSString *)message buttons:(NSArray<NSString *> *)buttonNames actions:(NSDictionary<NSString *,void (^)(void)> *)actions{
    if (IS_MORE_THAN(8.0)) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        for (NSInteger index = 0; index < buttonNames.count; index += 1) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:buttonNames[index] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (actions[buttonNames[index]] != nil) {
                    actions[buttonNames[index]]();
                }
                
                
            }];
            [alertController addAction:action];
        }
        
        
        
        [[self lastPresentVC] presentViewController:alertController animated:true completion:nil];
    }
    

}
+(void)alertTipTitle:(NSString *)title message:(NSString *)message actions:(NSDictionary<NSString *,void (^)(void)> *)actions buttons:(NSString *)buttonNames, ...NS_REQUIRES_NIL_TERMINATION{
    NSArray<NSString *> * newButtonNames = [self actionUseNum:buttonNames,nil];
    if (!IS_MORE_THAN(8.0)) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        
        for (NSInteger index = 0; index < newButtonNames.count; index += 1) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:newButtonNames[index] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if (actions[newButtonNames[index]] != nil) {
                    actions[newButtonNames[index]]();
                }
                
                
            }];
            [alertController addAction:action];
        }
        
        
        
        [[self lastPresentVC] presentViewController:alertController animated:true completion:nil];
    }
    

}

+(void)test{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 90000
     NSLog(@"Xcode支持9.0");
#else
     NSLog(@"项目不支持9.0");
    
#endif
}

+ (NSArray<NSString *> *)actionUseNum: (NSString *)actionNum, ...NS_REQUIRES_NIL_TERMINATION{
    NSMutableArray *argsArray = [[NSMutableArray alloc] init];
    //遍历开始
    
    va_list list;
    //使用第一个参数来初使化list指针
    va_start(list, actionNum);
    while (YES)
    {
        //返回可变参数，va_arg第二个参数为可变参数类型，如果有多个可变参数，依次调用可获取各个参数
        NSString *string = va_arg(list, NSString*);
        if (!string) {
            break;
        }
        NSLog(@"%@",string);
    }
    //结束可变参数的获取
    va_end(list);

    
    return argsArray;
}
@end
