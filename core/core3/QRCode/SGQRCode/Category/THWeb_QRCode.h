//
//  THWeb_QRCode.h
//  BigHTML5
//
//  Created by apple on 17/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SGQRCodeScanManager.h"

@class THWeb_QRCode;
@protocol THWeb_QRCodeDelegate<NSObject>

-(void) web_QRCode:(THWeb_QRCode *) web_qrCode url:(NSString *) url;

@end

@interface THWeb_QRCode : NSObject<SGQRCodeScanManagerDelegate>

@property(nonatomic,weak) UIViewController<THWeb_QRCodeDelegate> * vc;

+(NSString *) QRCodeImageURLWithUrl:(NSString *)url;
-(void) scanningQRCode;



@end
