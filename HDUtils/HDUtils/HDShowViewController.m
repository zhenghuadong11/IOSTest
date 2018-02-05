//
//  HDShowViewController.m
//  HDUtils
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "HDShowViewController.h"

@interface HDShowViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation HDShowViewController
{
    UITableView * _tableView;
    
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
-(void)setModels:(NSArray<NSString *> *)models{
    _models = models;
    [_tableView reloadData];
}
-(void) setDefault{
    
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
    if (self.nextControllers != nil && self.nextControllers.count > indexPath.row) {
            [self.navigationController pushViewController:self.nextControllers[indexPath.row] animated:true];
    }

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
