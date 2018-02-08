//
//  MYDrawerViewController.h
//  DrawerController
//
//  Created by zhenghuadong on 16/12/15.
//  Copyright © 2016年 zhenghuadong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYDrawerViewController : UIViewController


//设置之前请设好controllerView的宽度与高度
-(void) setLeftDrawController:(UIViewController *)drawController andMainController:(UIViewController *)mainController;

-(void) leftDrawShow;
-(void) leftUnShow;
@end
