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
#import "HDCollectionReusableView.h"


@interface THOrderViewController()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) HDConllectionView * collectionView;
@property(nonatomic,copy) NSArray <NSString *> * models;

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

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void) setDefault{
 
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
    [self.collectionView registerClass:[HDCollectionViewCell class] forCellWithReuseIdentifier:HDCollectionViewCellDef];
    [self.collectionView registerClass:[HDCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HDCollectionReusableViewDef];
 

}


#pragma mark --  collectionDelegate
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HDCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:HDCollectionViewCellDef forIndexPath:indexPath];
    
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
   
    return  CGSizeMake(0,0);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 30, 10);//（上、左、下、右）
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
    return CGSizeMake(300, 0);
}


-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.alpha = 0;
}
-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.alpha = 1;
}

@end
