//
//  Item2ViewController.m
//  StoryBoardTest
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "Item2ViewController.h"
#import "Item2TableViewCell.h"

#define Item_Cell @"Item2ViewCell"

@interface Item2ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation Item2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableview.frame = self.view.bounds;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    UINib * nib = [UINib nibWithNibName:@"ViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:Item_Cell];

//    [self.tableview registerClass:[Item2TableViewCell class] forCellReuseIdentifier:Item_Cell];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Item_Cell];


    return cell;
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
