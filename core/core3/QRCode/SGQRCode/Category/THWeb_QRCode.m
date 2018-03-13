//
//  THWeb_QRCode.m
//  BigHTML5
//
//  Created by apple on 17/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "THWeb_QRCode.h"
#import "SGQRCode.h"
#import <AVFoundation/AVFoundation.h>
#import "QRCodeGenerateVC.h"
#import "SGQRCodeScanningVC.h"

@implementation THWeb_QRCode
+(NSString *)QRCodeImageURLWithUrl:(NSString *)url{
    UIImage * image = [SGQRCodeGenerateManager SG_generateWithDefaultQRCodeData:@"https://github.com/kingsic" imageViewWidth:200];
    
    /*
    NSString * path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, true).firstObject;
    NSString * qrcodePath = [path stringByAppendingPathComponent:@"QRCode.png"];
    
    BOOL isSuccess = [UIImagePNGRepresentation(image) writeToFile:qrcodePath atomically:YES];
    if (isSuccess == true) {
        return qrcodePath;
    }else{
        return nil;
    }
     */
    NSData *imageData = UIImagePNGRepresentation(image);
    NSString *imageSource = [NSString stringWithFormat:@"data:image/png;base64,%@",[imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn]];
    return imageSource;
}

- (void)scanningQRCode{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        SGQRCodeScanningVC *vc = [[SGQRCodeScanningVC alloc] init];
                        vc.delegate = self;
                        [self.vc.navigationController pushViewController:vc animated:true];
                    });
                    
             
                    // 用户第一次同意了访问相机权限
                    //NSLog(@"用户第一次同意了访问相机权限");
                    
                } else {
                    
                    // 用户第一次拒绝了访问相机权限
                    //NSLog(@"用户第一次拒绝了访问相机权限");
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            SGQRCodeScanningVC *vc = [[SGQRCodeScanningVC alloc] init];
            vc.delegate = self;
            [self.vc.navigationController pushViewController:vc animated:true];
           // [self.vc presentViewController:vc animated:YES completion:nil];
        } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self.vc presentViewController:alertC animated:YES completion:nil];
            
        } else if (status == AVAuthorizationStatusRestricted) {
           // NSLog(@"因为系统原因, 无法访问相册");
        }
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alertA];
        [self.vc presentViewController:alertC animated:YES completion:nil];
    } 
    
}

- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager didOutputMetadataObjects:(NSArray<AVMetadataMachineReadableCodeObject *> *)metadataObjects{
    [self.vc web_QRCode:self url:metadataObjects.firstObject.stringValue];
}

@end
