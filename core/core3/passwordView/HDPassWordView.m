//
//  HDPassWordView.m
//  PassWordViewTest
//
//  Created by 郑华栋 on 2018/2/23.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDPassWordView.h"
#import "HDDefault.h"
#import "HDAnimationUtil.h"
#import "HDAnimationModel.h"
#import "HDValite.h"
#import "HDKeyBoardHeightUtil.h"

@class YNTextField;
@protocol YNTextFieldDelegate <NSObject>

- (void)ynTextFieldDeleteBackward:(YNTextField *)textField;

@end



@interface YNTextField : UITextField

@property (nonatomic, assign) id <YNTextFieldDelegate> yn_delegate;

@end
@implementation YNTextField

- (void)deleteBackward {
    //    ！！！这里要调用super方法，要不然删不了东西
    [super deleteBackward];
    
    if ([self.yn_delegate respondsToSelector:@selector(ynTextFieldDeleteBackward:)]) {
        [self.yn_delegate ynTextFieldDeleteBackward:self];
    }
}


@end
@interface HDPassWordView()<UITextFieldDelegate,YNTextFieldDelegate,HDKeyBoardHeightUtilDelegate>
@property(nonatomic,strong) NSMutableArray<YNTextField *> * textFields;
@property(nonatomic,assign) NSInteger selectNum;
@property (nonatomic, strong) HDKeyBoardHeightUtil * heightUtil;

@property(nonatomic,assign) CGFloat defaultY;

@property(nonatomic,strong) UIView * backView;
@property(nonatomic,assign) BOOL isShow;
@end

@implementation HDPassWordView
-(instancetype)init{
    if (self = [super init]) {
        _num = 6;
        _isNeedBack = true;
        [self setSubViews];
        [self setDelegateOrClick];
    }
    return self;
}
-(UIView *)backView{
    if (_backView == nil) {
        _backView = [[UIView alloc] init];
        _backView.backgroundColor = [UIColor grayColor];
        _backView.alpha = 0.3;
        _backView.frame = [UIScreen mainScreen].bounds;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backClick)];
        [_backView addGestureRecognizer:tap];
    }
    return _backView;
}
-(NSMutableArray<YNTextField *> *)textFields{
    if (_textFields == nil) {
        _textFields = [NSMutableArray array];
    }
    return _textFields;
}
-(void)moveToView:(UIView *)view{
    if (self.isNeedBack == true) {
        [[UIApplication sharedApplication].keyWindow addSubview:self.backView];
        [[UIApplication sharedApplication].keyWindow addSubview:self];
        
    }else{
        [view addSubview:self];
        

    }
    self.backgroundColor = [UIColor redColor];
    [self setFrameOrLayout:self.superview];
    [self animation];
    self.isShow = true;
    
}
-(void) setDelegateOrClick{
    self.heightUtil = [[HDKeyBoardHeightUtil alloc] init];
    self.heightUtil.delegate = self;
}

-(void) setFrameOrLayout:(UIView *) superView{
    CGPoint point = [superView convertPoint:CGPointZero toView:nil];
    

    
    self.height = 60;
    self.defaultY = superView.height - 350 - point.y - 60;
    self.y = self.defaultY;
    self.x = 0;
    self.width = SCREEN_W;
    
    
    CGFloat width = (SCREEN_W - Layout_375_x(80) * 2 - (self.num -1) * Layout_375_x(20))/self.num;
    if (width > Layout_375_x(100)) {
        width = Layout_375_x(100);
    }
    CGFloat height = width;
    CGFloat x =  (SCREEN_W - self.num * width - (self.num -1) * Layout_375_x(20))/2;
    CGFloat y = (self.height - height)/2;
//    CGFloat y = 0;
    for (NSInteger index = 0; index < self.num; index += 1) {
        self.textFields[index].frame = Rect_DEFAULT;
        x += width + Layout_375_x(20);
    }
    
}
-(void)setNum:(NSInteger)num{
    [self setSubViews];
}
-(void) setSubViews{
    for (NSInteger index = 0; index < self.num; index += 1) {
        YNTextField * textField;
        if (self.textFields.count > index) {
            textField = self.textFields[index];
        }else{
            textField = [[YNTextField alloc] init];
            [self.textFields addObject:textField];
            [self addSubview:textField];
        }
        textField.backgroundColor = [UIColor whiteColor];
        textField.keyboardType = UIKeyboardTypeDecimalPad;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.delegate = self;
        textField.yn_delegate = self;
        textField.layer.anchorPoint = CGPointMake(0, 0);
        textField.secureTextEntry = true;
    }
}

-(void) animation{
    for (NSInteger index = 0; index < self.num; index += 1) {
        UITextField * textField =self.textFields[index];
        
        HDAnimationModel * model = [[HDAnimationModel alloc] init];
        model.mass = 10;
        model.stiffness = 100;
        model.damping = 4000;
        model.duration = 0.5;
        if (self.textFields[index].x < self.width/2) {
            model.fromValue = [NSValue valueWithCGPoint:CGPointMake(-1 * textField.width, textField.y)];
            
        }else{
            model.fromValue = [NSValue valueWithCGPoint:CGPointMake(self.width + textField.width, textField.y)];
        }
        model.toValue = [NSValue valueWithCGPoint:CGPointMake(textField.x, textField.y)];
        [HDAnimationUtil animationWithSpringView:self.textFields[index] keyPath:@"position" property:model];
    }
    
    [self.textFields.firstObject becomeFirstResponder];
    
}

-(void)hiddenView{
    [self.backView removeFromSuperview];
    [self removeFromSuperview];
    self.isShow = false;
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSString * newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (newString.length == 1 && [HDValite isPureInt:newString]) {
        textField.text = newString;
        if(self.selectNum == self.num - 1){
            NSMutableString * password = [NSMutableString string];
            for (NSInteger index2 = 0; index2 <= self.selectNum; index2 += 1) {
                [password appendString:self.textFields[index2].text];
                self.textFields[index2].text = @"";
            }
            [self.delegate passWordView:self password:password];
        }else{
            [self.textFields[self.selectNum + 1] becomeFirstResponder];
        
        }

        
        return false;
    }else if([newString isEqualToString:@""]){
        textField.text = newString;
        
        if(self.selectNum != 0 && self.selectNum != self.num - 1){
            [self.textFields[self.selectNum - 1] becomeFirstResponder];
        
        }
        
        return false;
    }
    
    return false;
}
-(void)ynTextFieldDeleteBackward:(YNTextField *)textField{
  
  
    if(self.selectNum != 0){
        self.textFields[self.selectNum - 1].text = @"";
        [self.textFields[self.selectNum - 1] becomeFirstResponder];
    }
    
    
}
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    
    for (NSInteger index = 0; index < self.num; index += 1) {
        if (self.textFields[index] == textField) {
            self.selectNum = index;
        }
    }
    
    NSLog(@"开始编辑");
}

-(void) backClick{
    [self hiddenView];
}

-(void)troggleView:(UIView *)view{
    if (self.isShow == false) {
        [self moveToView:view];
    }else{
        [self hiddenView];
    }
    
}

#pragma mark --  keyBoard

-(void)keyBoardHeightUtil:(HDKeyBoardHeightUtil *)util showHeight:(CGFloat)height{
    self.y = self.defaultY + (350 - height);
}




@end
