//
//  HDUploadRequest.h
//  OrderManager
//
//  Created by apple on 2018/1/31.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDUploadRequest : NSMutableURLRequest

-(void) appendPartWithFileData:(NSData *) data paramName:(NSString *) name fileName:(NSString *)fileName mimeType:(NSString *)mimeType;
//这个在最后谢谢
-(void) setParams:(NSDictionary *) params;
@end
