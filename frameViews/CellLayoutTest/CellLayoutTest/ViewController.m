//
//  ViewController.m
//  CellLayoutTest
//
//  Created by apple on 2018/2/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "ImageTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,copy) NSArray<NSString *> * imageStrs;
@property(nonatomic,copy) NSArray<NSString *> * textStrs;
@end
#define ImageTableViewCellDef @"ImageTableViewCell"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefine];
    [self setSubViews];
    [self setUIConfig];
    [self setDelegateOrClick];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) setDefine{
    self.imageStrs = @[@"communiteTest",@"test1",@"communiteTest",@"communiteTest"];
    self.textStrs = @[@"fsdfa",@"adsfagaerga",@"adsfagaergaadsfagaergaadsfagaergaadsfagaergaadsfagaergaadsfagaergaadsfagaergaadsfagaergaadsfagaerga",@"fasfaehsehjslgjanflonaslfiualeiufnanlifnalnaliunlifunalifunanl"];
}
-(void) setSubViews{
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
}
-(void) setUIConfig{
    self.tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:@"ImageTableViewCell" bundle:nil] forCellReuseIdentifier:ImageTableViewCellDef];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 40;
}
-(void) setDelegateOrClick{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}
-(void) setFrameOrLayout{
    self.tableView.frame =self.view.bounds;
}
-(void)viewDidLayoutSubviews{
    [self setFrameOrLayout];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.imageStrs.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ImageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ImageTableViewCellDef];
    cell.textLabel.text = self.textStrs[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:self.imageStrs[indexPath.row]];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
