//
//  SGQRCodeScanningVC.h
//  SGQRCodeExample
//
//  Created by kingsic on 17/3/20.
//  Copyright © 2017年 kingsic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGQRCodeScanManager.h"

@interface SGQRCodeScanningVC : UIViewController
@property(nonatomic,weak) id <SGQRCodeScanManagerDelegate> delegate;
@end
