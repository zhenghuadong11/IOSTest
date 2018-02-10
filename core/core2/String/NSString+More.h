//
//  NSString+More.h
//  HDFrameCoreShow
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>



/**
 这里进行一些字符串的处理
 */
@interface NSString (More)
- (BOOL)isValidateByRegex:(NSString *)regex;
/*
 *  这里实现匹配所有合适的串，串之间不可以重叠
 */
- (NSArray<NSTextCheckingResult *> *)arrayNotOverlapWithRegex:(NSString *) regex;
/*
 *  这里实现匹配所有合适的串，串之间可以重叠
 */
- (NSArray<NSTextCheckingResult *> *)arrayOverlapWithRegex:(NSString *) regex;

/*
     这里获取字串
 */
-(NSArray<NSTextCheckingResult *> *) arrayNotOverlapWithRegex:(NSString *)regex withSubRegexRange:(NSRange) range;
/*
 * 规定范围获取所有的匹配
 */
- (NSArray<NSTextCheckingResult *> *)arrayOverlapWithRegex:(NSString *) regexStr withRange:(NSRange) range;
/*
 NSRegularExpressionCaseInsensitive             = 1 << 0, //不区分字母大小写的模式
 NSRegularExpressionAllowCommentsAndWhitespace  = 1 << 1, //忽略掉正则表达式中的空格和#号之后的字符
 NSRegularExpressionIgnoreMetacharacters        = 1 << 2, //将正则表达式整体作为字符串处理
 NSRegularExpressionDotMatchesLineSeparators    = 1 << 3, //允许.匹配任何字符，包括换行符
 NSRegularExpressionAnchorsMatchLines           = 1 << 4, //允许^和$符号匹配行的开头和结尾
 NSRegularExpressionUseUnixLineSeparators       = 1 << 5, //设置\n为唯一的行分隔符，否则所有的都有效。
 NSRegularExpressionUseUnicodeWordBoundaries    = 1 << 6 //使用Unicode TR#29标准作为词的边界，否则所有传统正则表达式的词边
 */
//NSRegularExpressionCaseInsensitive
/*
 NSMatchingReportProgress         = 1 << 0, //找到最长的匹配字符串后调用block回调
 NSMatchingReportCompletion       = 1 << 1, //找到任何一个匹配串后都回调一次block
 NSMatchingAnchored               = 1 << 2, //从匹配范围的开始出进行极限匹配
 NSMatchingWithTransparentBounds  = 1 << 3, //允许匹配的范围超出设置的范围
 NSMatchingWithoutAnchoringBounds = 1 << 4  //禁止^和$自动匹配行还是和结束  
 */
/*
 NSMatchingProgress               = 1 << 0, //匹配到最长串是被设置
 NSMatchingCompleted              = 1 << 1, //全部分配完成后被设置
 NSMatchingHitEnd                 = 1 << 2, //匹配到设置范围的末尾时被设置
 NSMatchingRequiredEnd            = 1 << 3, //当前匹配到的字符串在匹配范围的末尾时被设置
 NSMatchingInternalError          = 1 << 4  //由于错误导致的匹配失败时被设置
 */
/*
 -(NSRange)rangeOfString:(NSString *)searchString     //直接匹配
  [str rangeOfString:searchString options:NSRegularExpressionSearch];  //正则匹配
 */

//-(NSRange) rangeWithPreString:(NSString *) preString;
@end
