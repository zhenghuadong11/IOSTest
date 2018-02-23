//
//  AnimationViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/22.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "AnimationViewController.h"
#import "HDAnimationUtil.h"
@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton * button = [[UIButton alloc] init];
    button.frame = CGRectMake(130, 130, 50, 50);
    [button setTitle:@"base" forState:(UIControlStateNormal)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button];
    
    UIButton * button1 = [[UIButton alloc] init];
    button1.frame = CGRectMake(230, 230, 50, 50);
    button1.backgroundColor = [UIColor redColor];
    [button1 setTitle:@"group" forState:(UIControlStateNormal)];
    [button1 addTarget:self action:@selector(click1:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button1];
    
    
    UIButton * button2 = [[UIButton alloc] init];
    button2.frame = CGRectMake(130, 330, 50, 50);
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"keyframe" forState:(UIControlStateNormal)];
    [button2 addTarget:self action:@selector(click2:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button2];
    
    UIButton * button3 = [[UIButton alloc] init];
    button3.frame = CGRectMake(130, 430, 50, 50);
    button3.backgroundColor = [UIColor redColor];
    [button3 setTitle:@"spring" forState:(UIControlStateNormal)];
    [button3 addTarget:self action:@selector(click3:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button3];
    
    UIButton * button4 = [[UIButton alloc] init];
    button4.frame = CGRectMake(130, 530, 50, 50);
    button4.backgroundColor = [UIColor redColor];
    [button4 setTitle:@"transition" forState:(UIControlStateNormal)];
    [button4 addTarget:self action:@selector(click4:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:button4];
}
-(void) click:(UIButton *) button{

    HDAnimationModel * model = [[HDAnimationModel alloc] init];
    model.toValue = [NSValue valueWithCGSize:(CGSizeMake(100, 100))];
    model.duration = 2.5;
    model.repeatCount = 100;
    model.isReverse = true;
    [HDAnimationUtil animationWithBaseView:button keyPath:@"bounds.size" property:model];
}

-(void) click1:(UIButton *) button1{
    HDAnimationModel * model = [[HDAnimationModel alloc] init];
    model.toValue = [NSValue valueWithCGSize:(CGSizeMake(100, 100))];
    //    model.duration = 2.5;
    model.repeatCount = 100;
    model.isReverse = true;
    model.keyPath = @"bounds.size";
    
    
    HDAnimationModel * model1 = [[HDAnimationModel alloc] init];
    model1.values = @[[NSValue valueWithCGPoint:CGPointMake(230, 230)],[NSValue valueWithCGPoint:CGPointMake(330, 230)]];
    //    model1.duration = 2.5;
    model1.repeatCount = 100;
    model1.isReverse = true;
    model1.keyPath = @"position";
    
    button1.layer.anchorPoint = CGPointMake(0, 0);
    HDAnimationModel * groupModel = [[HDAnimationModel alloc] init];
    groupModel.duration = 2.5;
    groupModel.repeatCount = 100;
    groupModel.isReverse = true;
    [HDAnimationUtil animationWithGrounpView:button1 propertys:@[model,model1] groupProperty:groupModel];
    
}

-(void) click2:(UIButton *) button{
    //    [HDAnimationUtil animationView:button keyPath:@"bounds.size" toValue:[NSValue valueWithCGSize:(CGSizeMake(100, 100))]];
    HDAnimationModel * model = [[HDAnimationModel alloc] init];
    model.duration = 2.5;
    model.repeatCount = 100;
    model.isReverse = true;
    //(330, 130, 50, 50);
//    button.layer.frame.origin
    button.layer.anchorPoint = CGPointMake(0, 0);
    [HDAnimationUtil animationWithKeyFrameView:button keyPath:@"position" values:@[
                                                                    [NSValue valueWithCGPoint:CGPointMake(130, 330)],
                                                                    [NSValue valueWithCGPoint:CGPointMake(230, 330)],
                                                                    [NSValue valueWithCGPoint:CGPointMake(230, 430)],
                                                                    [NSValue valueWithCGPoint:CGPointMake(130, 430)],
                                                                    [NSValue valueWithCGPoint:CGPointMake(130, 330)],
                                                                                   ] property:model];
}
-(void) click3:(UIButton *) button{
    HDAnimationModel * model = [[HDAnimationModel alloc] init];
    model.toValue = [NSValue valueWithCGSize:(CGSizeMake(100, 100))];
    model.duration = 2;
    model.repeatCount = INT_MAX;
    model.isReverse = true;
    model.isNotReset = true;
    model.mass = 10.0; //质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大
    model.stiffness = 5000; //刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    model.damping = 100.0;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    model.initialVelocity = 5.f;
    [HDAnimationUtil animationWithSpringView:button keyPath:@"bounds.size" property:model];
    

}

-(void) click4:(UIButton *) button{
    HDAnimationModel * model = [[HDAnimationModel alloc] init];
    model.toValue = [NSValue valueWithCGSize:(CGSizeMake(100, 100))];
    model.duration = 2;
    model.repeatCount = INT_MAX;
//    model.isReverse = true;
    
    [HDAnimationUtil animationWithTransitionView:button type:kCATransitionPageCurl property:model];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
