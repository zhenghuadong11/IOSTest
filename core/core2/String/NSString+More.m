//
//  NSString+More.m
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "NSString+More.h"
@implementation NSString (More)


/*
 https://c.runoob.com/front-end/854
 一些特殊规则的校验直接查询这里就可以了
 
 */
- (BOOL)isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    
    return [pre evaluateWithObject:self];
}

- (NSArray<NSTextCheckingResult *> *)arrayNotOverlapWithRegex:(NSString *) regex{
  
    
    NSRegularExpression * regex2 = [NSRegularExpression regularExpressionWithPattern:regex options:0 error:nil];
    //    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    
    return [regex2 matchesInString:self options:(NSMatchingReportProgress) range:NSMakeRange(0, [self length])];
}

- (NSArray<NSTextCheckingResult *> *)arrayOverlapWithRegex:(NSString *) regexStr{
    NSRegularExpression * regex2 = [NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:nil];
    //    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    
    
    
    
    NSArray<NSTextCheckingResult *> * array = [regex2 matchesInString:self options:(NSMatchingReportProgress) range:NSMakeRange(0, [self length])];
    
    NSMutableArray<NSTextCheckingResult *> * moreArray = [NSMutableArray<NSTextCheckingResult *> array];
    NSMutableString * newRegexStr = [NSMutableString stringWithString:regexStr];
    
   
    
    [newRegexStr insertString:@"^" atIndex:0];
    [newRegexStr appendString:@"$"];
     NSRegularExpression * newRegex = [NSRegularExpression regularExpressionWithPattern:newRegexStr options:(NSRegularExpressionAnchorsMatchLines) error:nil];
    
    for (NSInteger index = 0; index < array.count; index += 1) {
        
//        NSLog(@"%@",self substringWithRange:);
        
        
        NSInteger location = array[index].range.location;
        NSInteger length = array[index].range.length;
        
        for (NSInteger index2 = location; index2 < location + length; index2 += 1) {
            for (NSInteger index3 = index2; index3 < self.length; index3 += 1) {
//                NSLog(@"index2 %ld , index3 %ld",index2,index3);
                
                NSArray<NSTextCheckingResult *> * array1 = [newRegex matchesInString:self options:(NSMatchingAnchored) range:NSMakeRange(index2, index3 - index2 + 1)];
//                NSLog(@"%ld",array1.count);
                if (array1 != nil && array1.count > 0) {
//                    NSLog(@"range:%ld %ld",array1[0].range.location,array1[0].range.location + array1[0].range.length - 1);
//                    [moreArray addObjectsFromArray:array1];
                    [moreArray addObject:array1.firstObject];
                }
            }
        }
//        [moreArray addObject:array[index]];
        
    }
    return moreArray;
//    return
}

/*
 * 规定范围获取所有的匹配
 */
- (NSArray<NSTextCheckingResult *> *)arrayOverlapWithRegex:(NSString *) regexStr withRange:(NSRange) range{
    NSRegularExpression * regex2 = [NSRegularExpression regularExpressionWithPattern:regexStr options:0 error:nil];
    //    NSTextCheckingResult *result = [regex firstMatchInString:searchText options:0 range:NSMakeRange(0, [searchText length])];
    
    
    
    
    NSArray<NSTextCheckingResult *> * array = [regex2 matchesInString:self options:(NSMatchingReportProgress) range:range];
    
    NSMutableArray<NSTextCheckingResult *> * moreArray = [NSMutableArray<NSTextCheckingResult *> array];
    NSMutableString * newRegexStr = [NSMutableString stringWithString:regexStr];
    
    
    
    [newRegexStr insertString:@"^" atIndex:0];
    [newRegexStr appendString:@"$"];
    NSRegularExpression * newRegex = [NSRegularExpression regularExpressionWithPattern:newRegexStr options:(NSRegularExpressionAnchorsMatchLines) error:nil];
    
    for (NSInteger index = 0; index < array.count; index += 1) {
        
        NSInteger location = array[index].range.location;
        NSInteger length = array[index].range.length;
        
        for (NSInteger index2 = location; index2 < location + length; index2 += 1) {
            for (NSInteger index3 = index2; index3 < self.length; index3 += 1) {
                //                NSLog(@"index2 %ld , index3 %ld",index2,index3);
                
                NSArray<NSTextCheckingResult *> * array1 = [newRegex matchesInString:self options:(NSMatchingAnchored) range:NSMakeRange(index2, index3 - index2 + 1)];
                //                NSLog(@"%ld",array1.count);
                if (array1 != nil && array1.count > 0) {
                    //                    NSLog(@"range:%ld %ld",array1[0].range.location,array1[0].range.location + array1[0].range.length - 1);
                    //                    [moreArray addObjectsFromArray:array1];
                    [moreArray addObject:array1.firstObject];
                }
            }
        }
        //        [moreArray addObject:array[index]];
        
    }
    return moreArray;
    //    return
}




-(NSArray<NSTextCheckingResult *> *)arrayNotOverlapWithRegex:(NSString *)regex withSubRegexRange:(NSRange)range{
    //取出所有匹配子串的结果。不重复的
    NSArray<NSTextCheckingResult *> * results = [self arrayNotOverlapWithRegex:regex];
    
    NSLog(@"subString: %@",[self substringWithRange:results.firstObject.range]);
    
    NSLog(@"%@",regex);
    
    NSString * preSubRegex = [regex substringToIndex:range.location];
    NSString * subRegex = [regex substringWithRange:range];
    NSString * suffixSubRegex = [regex substringFromIndex:range.length + range.location];
    
    NSLog(@"%@",preSubRegex);
    NSLog(@"%@",subRegex);
    NSLog(@"%@",suffixSubRegex);
    
    
    //装载所有的返回值
    NSMutableArray<NSTextCheckingResult *> * mResults = [NSMutableArray array];
    
    

    for (NSInteger index = 0; index < results.count; index += 1) {
        NSString * subString = [self substringWithRange:results[index].range];
        
        NSLog(@"%@",subString);

        // 子匹配匹配的所有的结果
       NSArray<NSTextCheckingResult *> * subResults = [self arrayOverlapWithRegex:subRegex withRange:results[index].range];
        
        for (NSInteger index2 = 0; index2 < subResults.count; index2 += 1) {
            
            
            
            NSString * preSubString = [self substringWithRange:NSMakeRange(results[index].range.location, subResults[index2].range.location - results[index].range.location)];
            NSString * sub_subString = [self substringWithRange:subResults[index2].range];
            NSString * suffixSubStirng = [self substringWithRange:NSMakeRange(subResults[index2].range.location + subResults[index2].range.length,results[index].range.location + results[index].range.length - subResults[index2].range.location - subResults[index2].range.length)];

            NSLog(@"%@",preSubString);
            NSLog(@"%@",sub_subString);
            NSLog(@"%@",suffixSubStirng);
            
            if ([preSubString isValidateByRegex:preSubRegex] && [suffixSubStirng isValidateByRegex:suffixSubRegex]) {
                if (mResults.count == 0) {
                    [mResults addObject:subResults[index2]];
                }else if(mResults.lastObject.range.location + mResults.lastObject.range.length <= subResults[index2].range.location){
                    [mResults addObject:subResults[index2]];
                }
            }
            
        }
        
        
    }
    
    return mResults;
}


@end
