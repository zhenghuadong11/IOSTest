//
//  NullViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/5.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "NullViewController.h"
#import "HDNullUtil.h"
#import "HDTip.h"
@interface NullViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;
@property (weak, nonatomic) IBOutlet UITextField *tf3;

@end

@implementation NullViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)login:(id)sender {
    NSObject * obj = nil;
    if ([HDNullUtil checkNulltips:@[@"t1空",@"t2空",@"t3空",@"4空"] isStrict:false objects:_textField1.text,_tf2.text,_tf3.text,nil]) {
        return;
    }

    [HDTip alertTipTitle:@"可以登陆" message:nil];
}
- (IBAction)strictLogin:(id)sender {
    NSObject * obj = nil;
    if ([HDNullUtil checkNulltips:@[@"t1空",@"t2空",@"t3空",@"4空"] isStrict:true objects:_textField1.text,_tf2.text,_tf3.text,obj]) {
        return;
    }
    
    [HDTip alertTipTitle:@"可以登陆" message:nil];
}
- (IBAction)nullNum:(id)sender {
    NSLog(@"空的数量%ld",(long)[HDNullUtil numOfNullObjectIsStrict:false objects:nil,@"f",@"fad",nil,[NSNull null]]);
    
}


//- (void)viewDidLoad {
//    [super viewDidLoad];
//
//    //http://blog.csdn.net/grozy_sun/article/details/27634575?utm_source=tuicool
//    [self list:@"123",@"456",@"789",@"435",@"756",nil];
//
//    [self strFormat:@"123~~%@",@"124"];
//}
//
//
//
//- (void)strFormat:(NSString *)format,...{
//    va_list args;
//    va_start(args, format);
//    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
//    va_end(args);
//
//    NSLog(@"%@",message);
//}
//
//
//- (void)list:(NSString *)string,...{
//    //定义一个指向个数可变的参数列表指针
//    va_list args ; // typedef char* va_list;
//
//    //对args（列表指针）进行初始化,它指向可变参数表里面的第一个参数\
//    第一个参数是args本身，第二个参数是在变参表前面紧挨着的一个变量,即“...”之前的那个参数；
//
//    va_start(args, string);
//    if (string) {
//        NSString *otherString ;
//        NSLog(@"%@",string); //输出第一个字符串
//        while (1) {
//            //va_arg: 第二个参数是获取了类型。然后返回这个指定类型的值
//            //并把args的位置指向变参表的下一个变量位置
//            otherString = va_arg(args, NSString *);
//            if (otherString == nil) {
//                break;
//            }else{
//                NSLog(@"%@",otherString);
//            }
//        }
//    }
//    //va_end(arg_ptr)：清空参数列表，并置参数指针arg_ptr无效
//    //获取完成后，需要将指针关掉，以避免发生危险
//    va_end(args);
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
