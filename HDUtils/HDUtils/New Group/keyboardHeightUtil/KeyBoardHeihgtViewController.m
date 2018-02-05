//
//  KeyBoardHeihgtViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "KeyBoardHeihgtViewController.h"
#import "HDKeyBoardHeightUtil.h"
@interface KeyBoardHeihgtViewController ()<HDKeyBoardHeightUtilDelegate>

@end

@implementation KeyBoardHeihgtViewController
{
    UILabel * _statusLb;
    UITextField * _textField;
    HDKeyBoardHeightUtil * _util;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _statusLb = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    _textField.layer.borderColor = [UIColor grayColor].CGColor;
    _textField.layer.borderWidth = 1;
    [self.view addSubview:_statusLb];
    [self.view addSubview:_textField];
    
    _util = [[HDKeyBoardHeightUtil alloc] init];
    
    _util.delegate = self;
}
-(void)keyBoardHeightUtilHidden:(HDKeyBoardHeightUtil *)util{
    _statusLb.text = @"键盘隐藏了";
}
-(void)keyBoardHeightUtil:(HDKeyBoardHeightUtil *)util showHeight:(CGFloat)height{
    _statusLb.text = [NSString stringWithFormat:@"键盘弹出高度：%lf",height];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
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
