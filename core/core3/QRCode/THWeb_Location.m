//
//  THWeb_Location.m
//  BigHTML5
//
//  Created by apple on 17/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "THWeb_Location.h"
#define MORE_IOS(x) ([[UIDevice currentDevice].systemVersion floatValue] > x)

@implementation THWeb_Location{
    BOOL _isStartLocation;
    NSInteger _getNum;
}
-(instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

-(void)startLocation{
    [CLLocationManager locationServicesEnabled];
    [self locationStart];
}
-(CLLocationManager *)lManager{
    if (_lManager == nil) {
        _lManager = [[CLLocationManager alloc] init];
        _lManager.delegate = self;
        [_lManager setDesiredAccuracy:(kCLLocationAccuracyBest)];
    }
    
    return _lManager;
}
-(void) locationStart{
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined:
            
        case kCLAuthorizationStatusRestricted:
            
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            if (MORE_IOS(8)) {
                [self.lManager requestAlwaysAuthorization];
            }
            if (MORE_IOS(9)) {
               // [self.lManager setAllowsBackgroundLocationUpdates:true];
            }
            _isStartLocation = true;
            [self.lManager startUpdatingLocation];
            break;
        case kCLAuthorizationStatusDenied:
            [self isSetting];
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            _isStartLocation = true;
            _getNum = 0;
            [self.lManager startUpdatingLocation];
            break;
            
        default:
            break;
    }
}
-(void) locationRegister{
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined:
            
        case kCLAuthorizationStatusRestricted:
            
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            if (MORE_IOS(8)) {
                [self.lManager requestAlwaysAuthorization];
            }
            if (MORE_IOS(9)) {
                //[self.lManager setAllowsBackgroundLocationUpdates:true];
            }
            break;
        case kCLAuthorizationStatusDenied:
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            break;
            
        default:
            break;
    }
}

/*
 switch ([CLLocationManager authorizationStatus]) {
 case kCLAuthorizationStatusNotDetermined:
 
 case kCLAuthorizationStatusRestricted:
 
 
 case kCLAuthorizationStatusAuthorizedWhenInUse:
 if (MORE_IOS(8)) {
 [self.lManager requestAlwaysAuthorization];
 }
 if (MORE_IOS(9)) {
 [self.lManager setAllowsBackgroundLocationUpdates:true];
 }
 _isStartLocation = true;
 [self.lManager startUpdatingLocation];
 break;
 case kCLAuthorizationStatusDenied:
 [self isSetting];
 break;
 case kCLAuthorizationStatusAuthorizedAlways:
 _isStartLocation = true;
 [self.lManager startUpdatingLocation];
 break;
 
 default:
 break;
 }
 */
- (void) isSetting{
    
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:nil message:@"开启定位吗" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"前往设置", nil];
    [alertView show];
}
-(void)isDeniedToSet{
    switch ([CLLocationManager authorizationStatus]) {
        case kCLAuthorizationStatusNotDetermined:
            
        case kCLAuthorizationStatusRestricted:
            
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            if (MORE_IOS(8)) {
                [self.lManager requestAlwaysAuthorization];
            }
            if (MORE_IOS(9)) {
               // [self.lManager setAllowsBackgroundLocationUpdates:true];
            }
            if (_isStartLocation == false) {
                _isStartLocation = true;
                _getNum = 0;
                [self.lManager startUpdatingLocation];
            }
            break;
        case kCLAuthorizationStatusDenied:
            [self isSetting];
            break;
        case kCLAuthorizationStatusAuthorizedAlways:
            if (_isStartLocation == false) {
                _isStartLocation = true;
                _getNum = 0;
                [self.lManager startUpdatingLocation];
            }
            break;
            
            
            
        default:
            break;
    }
}
#pragma mark CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    _getNum += 1;
    
    [manager stopUpdatingLocation];
    
    if (_getNum > 1) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(THWeb_Location:longitude:latitude:)]) {
        NSString * latitudeStr = [NSString stringWithFormat:@"%f",locations.firstObject.coordinate.latitude];
        NSString * longitudeStr = [NSString stringWithFormat:@"%f",locations.firstObject.coordinate.longitude];
        
        [self.delegate THWeb_Location:self longitude:longitudeStr latitude:latitudeStr];
        
    }
    
    
}

#pragma mark --UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 1) {
        [self toSetting];
    }
}


-(void) toSetting{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if (MORE_IOS(10.0)) {
        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
    }
    
    
}

@end
