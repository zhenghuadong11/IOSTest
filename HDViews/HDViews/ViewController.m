//
//  ViewController.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "ViewController.h"
#import "RequestButtonViewController.h"
//#import ""
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController
{
    UITableView * _tableView;
    NSArray<NSString *> * _models;
}

#define UITableViewCellDef @"UITableViewCell"
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setDefault];
    [self setSubViews];
    [self setConfig];
    [self setDelegateOrClick];
    [self setFrameOrLayout];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) setDefault{
    _models = @[@"请求按钮"];
}
-(void) setSubViews{
    _tableView = [[UITableView alloc] init];
    [self.view addSubview:_tableView];
}
-(void) setDelegateOrClick{
    _tableView.delegate = self;
    _tableView.dataSource = self;
}
-(void) setConfig{
    self.title = @"视图目录";
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCellDef];
}
-(void) setFrameOrLayout{
    _tableView.frame = self.view.bounds;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _models.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellDef];
    
    cell.textLabel.text = _models[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RequestButtonViewController * vc = [[RequestButtonViewController alloc] init];
    [self.navigationController pushViewController:vc animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
