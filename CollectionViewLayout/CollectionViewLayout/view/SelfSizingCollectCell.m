//
//  SelfSizingCollectCell.m
//  CollectionViewLayout
//
//  Created by apple on 2018/2/4.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SelfSizingCollectCell.h"
#import "Masonry.h"
#define itemHeight 60
@implementation SelfSizingCollectCell
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor redColor];
        // 用约束来初始化控件:
        self.textLabel = [[UILabel alloc] init];
        self.textLabel.textAlignment =NSTextAlignmentCenter;
        self.textLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:self.textLabel];
#pragma mark — 如果使用CGRectMake来布局,是需要在preferredLayoutAttributesFittingAttributes方法中去修改textlabel的frame的
        // self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        
#pragma mark — 如果使用约束来布局,则无需在preferredLayoutAttributesFittingAttributes方法中去修改cell上的子控件l的frame
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            // make 代表约束:
            make.top.equalTo(self.contentView).with.offset(0);   // 对当前view的top进行约束,距离参照view的上边界是 :
            make.left.equalTo(self.contentView).with.offset(0);  // 对当前view的left进行约束,距离参照view的左边界是 :
            make.height.equalTo(@(itemHeight/2));                // 高度
            make.right.equalTo(self.contentView).with.offset(0); // 对当前view的right进行约束,距离参照view的右边界是 :
        }];
    }
    return self;
}

#pragma mark — 实现自适应文字宽度的关键步骤:item的layoutAttributes
- (UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    
    UICollectionViewLayoutAttributes *attributes = [super preferredLayoutAttributesFittingAttributes:layoutAttributes];
    
    CGRect frame = [self.textLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.textLabel.frame.size.height) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:[NSDictionary dictionaryWithObjectsAndKeys:self.textLabel.font,NSFontAttributeName, nil] context:nil];
    
    frame.size.height = itemHeight;
    attributes.frame = frame;
    
    // 如果你cell上的子控件不是用约束来创建的,那么这边必须也要去修改cell上控件的frame才行
    // self.textLabel.frame = CGRectMake(0, 0, attributes.frame.size.width, 30);
    
    return attributes;
}
@end
