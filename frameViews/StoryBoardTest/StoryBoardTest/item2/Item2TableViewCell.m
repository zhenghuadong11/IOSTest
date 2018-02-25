//
//  Item2TableViewCell.m
//  StoryBoardTest
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "Item2TableViewCell.h"

@implementation Item2TableViewCell
//+(instancetype)xibTableViewCell {
//      //在类方法中加载xib文件,注意:loadNibNamed:owner:options:这个方法返回的是NSArray,所以在后面加上firstObject或者lastObject或者[0]都可以;因为我们的Xib文件中,只有一个cell
//     return [[[NSBundle mainBundle] loadNibNamed:@"ViewCell" owner:nil options:nil] lastObject];
//
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSLog(@"执行次数");
    self.nameLB.text = @"小红";
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    NSLog(@"点击选择");
}

@end
