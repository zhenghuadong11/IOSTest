//
//  THWeb_Location.h
//  BigHTML5
//
//  Created by apple on 17/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@class THWeb_Location;
@protocol THWeb_LocationDelegate <NSObject>

-(void) THWeb_Location:(THWeb_Location *) web_Location longitude:(NSString *)longitude latitude:(NSString *)latitude;

@end

@interface THWeb_Location : NSObject<CLLocationManagerDelegate,UIAlertViewDelegate>
-(void) startLocation;
-(void) locationRegister;
@property(nonatomic,strong) CLLocationManager * lManager;

@property(nonatomic,weak) id<THWeb_LocationDelegate> delegate;

@end
