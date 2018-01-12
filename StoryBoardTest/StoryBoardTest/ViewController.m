//
//  ViewController.m
//  StoryBoardTest
//
//  Created by apple on 2018/1/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "MYTabBarViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backImageVIew;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.backImageVIew.frame = self.view.bounds;
    
}

- (IBAction)btnClick:(id)sender {
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"StoryboardFrame" bundle:[NSBundle mainBundle]];
    MYTabBarViewController * tabView =  [story instantiateViewControllerWithIdentifier:@"Start"];
    
    
    [self presentViewController:tabView animated:true completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
