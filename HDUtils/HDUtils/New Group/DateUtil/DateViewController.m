//
//  DateViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/10.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "DateViewController.h"
#import "NSDate+Time.h"

@interface DateViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nowDate;
@property (weak, nonatomic) IBOutlet UITextField *fomatField;
@property (weak, nonatomic) IBOutlet UILabel *dateToStr;
@property (weak, nonatomic) IBOutlet UILabel *strToDate;
@property (weak, nonatomic) IBOutlet UILabel *dateTodate;

@end

@implementation DateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDate * date = [NSDate date];
    self.nowDate.text = [date description];
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)commit:(id)sender {
    self.dateToStr.text =[[NSDate date] stringWithFormat:self.fomatField.text];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *date = [dateFormatter dateFromString:@"2010-08-04 16:01:03"];
    NSDate * date = [self.dateToStr.text dateWithFormat:self.fomatField.text];
    
    self.strToDate.text = [date description];

    
}
- (IBAction)dateToDateCommit:(id)sender {
    self.dateTodate.text = [[[NSDate date] dateWithFormat:self.fomatField.text] description];
    
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
