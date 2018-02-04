//
//  HDTipVC.m
//  TipTest
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HDTipVC.h"

@interface HDTipVC ()<UIAlertViewDelegate>
@property(nonatomic,strong) UIAlertView * alertView;
@end

@implementation HDTipVC


-(void)showWith:(NSString *)buttonNames, ...{
    self.alertView = [[UIAlertView alloc] initWithTitle:self.tipTitle message:self.message delegate:self cancelButtonTitle:nil otherButtonTitles:buttonNames,nil];
    [self.alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
