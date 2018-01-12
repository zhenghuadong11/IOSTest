//
//  Item3View.m
//  StoryBoardTest
//
//  Created by apple on 2018/1/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "Item3View.h"

@implementation Item3View



-(void)awakeFromNib{
    [super awakeFromNib];
   
    self.contentView =   [[NSBundle mainBundle] loadNibNamed:@"Item3View" owner:self options:nil].lastObject;
    self.contentView.frame = self.bounds;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
