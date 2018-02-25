//
//  THOrderViewController.m
//  HDViews
//
//  Created by 郑华栋 on 2018/2/24.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import "THOrderViewController.h"
#import "HDConllectionView.h"
#import "HDCollectionViewCell.h"
#import "HDDefault.h"
#import "HDCollectionReusableView.h"
#import "THOrderModel.h"

@interface THOrderViewController()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) HDConllectionView * collectionView;
@property(nonatomic,copy) NSArray <THOrderModel *> * models;

@property(nonatomic,strong) UIView * headView;

@property(nonatomic,assign) CGFloat lastOffset;
@property(nonatomic,assign) BOOL isHeadBelow;
@end
#define HDCollectionViewCellDef @"HDCollectionViewCell"
#define HDCollectionReusableViewDef @"HDCollectionReusableView"

@implementation THOrderViewController
-(HDConllectionView *)collectionView{
    if (_collectionView == nil) {
        _collectionView = [HDConllectionView baseHeaderFixCollectionView];
    }
    return _collectionView;
}
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
    self.models = @[
                    [THOrderModel modelWithDict:@{@"title":@"nihao",@"money":@(12)}],
                    [THOrderModel modelWithDict:@{@"title":@"nihao",@"money":@(12)}],
                    [THOrderModel modelWithDict:@{@"title":@"nihao",@"money":@(12)}],
                    [THOrderModel modelWithDict:@{@"title":@"nihao",@"money":@(12)}],
                    [THOrderModel modelWithDict:@{@"title":@"nihao",@"money":@(12)}],
                    [THOrderModel modelWithDict:@{@"title":@"nihao",@"money":@(12)}],
                    [THOrderModel modelWithDict:@{@"title":@"nihao",@"money":@(12)}],
                    ];
}
-(void) setSubViews{
    
    
    
    
    self.headView = [[NSBundle mainBundle] loadNibNamed:@"THOrderHeaderView" owner:self options:nil].lastObject;
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.headView];
    
}
-(void) setDelegateOrClick{

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}
-(void) setConfig{
//    self.headView.backgroundColor = [UIColor redColor];
    [self.collectionView registerClass:[HDCollectionViewCell class] forCellWithReuseIdentifier:HDCollectionViewCellDef];
    [self.collectionView registerClass:[HDCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HDCollectionReusableViewDef];
    self.view.backgroundColor = [UIColor blueColor];
    self.collectionView.backgroundColor = [UIColor colorWithHexString:@"efeff1"];
    self.headView.backgroundColor = [UIColor colorWithHexString:@"efeff1"];
}
-(void) setFrameOrLayout{
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat width = self.view.frame.size.width;
    CGFloat height = self.view.frame.size.height;
    
    
    
    
    x = 0;
    y = 0;
    height = 170;
    self.headView.frame = CGRectMake(x, y, width, height);
    
    x = 0;
    y = 170;
    height = self.view.frame.size.height - 170;
    self.collectionView.frame = CGRectMake(x, y, width, height);
    
    
    
}

#pragma mark --  collectionDelegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HDCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:HDCollectionViewCellDef forIndexPath:indexPath];
    
    cell.model = self.models[indexPath.row];
    return cell;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.models.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (self.view.width-20) /2.1;
    return  CGSizeMake(width,Layout_675_y(480));
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 30, 10);//（上、左、下、右）
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath NS_AVAILABLE_IOS(9_0){
    return YES;
}


#pragma mark --  collectionHeaderView
- (UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView * reusable;
    if (kind == UICollectionElementKindSectionHeader) {
        HDCollectionReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HDCollectionReusableViewDef forIndexPath:indexPath];
        reusable = view;
    }
    return reusable;
    
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(300, Layout_675_y(70));
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGRect rect = self.headView.frame;
    rect.origin.y -=  scrollView.contentOffset.y;
    
    if (scrollView.contentOffset.y < 0 && rect.origin.y > 0) {
        rect.origin.y = -scrollView.contentOffset.y;
    }
    
    
    BOOL isSetZero = true;
    
    if (rect.origin.y + rect.size.height < 0) {
        rect.origin.y = rect.size.height * -1;
        isSetZero = false;
    }
    
    if (rect.origin.y > 0 && self.isHeadBelow == false) {
        rect.origin.y = 0;
        self.isHeadBelow = true;
    }
    if (rect.origin.y < 0) {
        self.isHeadBelow = false;
    }
    
    self.headView.frame =rect;
    
    if (rect.origin.y <= 0) {
        rect = scrollView.frame;
        rect.origin.y = self.headView.frame.size.height + self.headView.frame.origin.y;
        rect.size.height = self.view.frame.size.height - rect.origin.y;
        scrollView.frame = rect;
        
        if (isSetZero) {
            [scrollView setContentOffset:CGPointMake(0, 0)];
        }
    }
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.alpha = 0;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.alpha = 1;
}

@end
