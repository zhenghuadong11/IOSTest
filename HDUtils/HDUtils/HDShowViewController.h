//
//  HDShowViewController.h
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>
/*用于类库展示的控制器*/
@interface HDShowViewController : UIViewController
@property(nonatomic,copy) NSArray<NSString *> * models;
@property(nonatomic,copy) NSArray<UIViewController *> * nextControllers;
@end
