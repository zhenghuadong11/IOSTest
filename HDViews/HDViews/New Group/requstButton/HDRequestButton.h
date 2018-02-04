//
//  HDRequestButton.h
//  HDViews
//
//  Created by 郑华栋 on 2018/2/4.
//  Copyright © 2018年 郑华栋. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDRequestButton : UIButton

-(void) setNormalTest:(NSString *) normalTest requestTest:(NSString *) requestTest;

-(void) isRequesting:(BOOL) isRequesting;

@end
