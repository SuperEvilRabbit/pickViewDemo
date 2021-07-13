//
//  NSString+LKString.h
//  StudentPlatform
//
//  Created by 李康康 on 2018/11/14.
//  Copyright © 2018年 李康康. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (LKString)
/**
 * @brief app缓存文件夹
 */
+ (NSString *)AppCachePath;

/**
 * @brief app下载文件夹
 */
+ (NSString *)AppDownLoadCachePath;
/**
 *  转换为Base64编码
 */
- (NSString *)base64EncodedString;
/**
 *  将Base64编码还原
 */
- (NSString *)base64DecodedString;
/**
 * @brief 计算字体尺寸
 */
- (CGSize)getSizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (CGFloat)caculatorHeightWithString:(NSString *)string width:(CGFloat )width font:(UIFont *)font lineSpace:(CGFloat )lineSpace;
/**
 * @brief 获取时间当前时间戳
 */
+ (NSString *)getCurrentTimestamp;

/**
 * @brief 获取程序目录
 */
+ (NSString *)getAppDocumentPath;

/**
 * @brief 是否是空字符
 */
+ (BOOL)isAllEmpty:(NSString *)str;

/**
 * @brief 空字符转换为@“0”
 */
+ (NSString *)getZeroWithAmount:(NSString *)aAmount;

/**
 * @brief 空数据处理
 */
+(NSString *)returnNullStringWithString:(NSString *)string;

/**
 * @brief 空数据返回空格
 */
+(NSString *)returnSpaceWithString:(NSString *)string;


- (NSString *)retainDecimal;

/**
 * @brief 是否是电话号
 */
- (BOOL)isMobileNumber;

/**
 * @brief 判断是否字母或数字
 */
+ (BOOL)inputShouldLetterAndNum:(NSString *)inputString;

/**
 * @brief 判断是否同时包含大小写字母和数字
 */
+ (BOOL)chekPassWordValid:(NSString *)inputString;

/**
 * @brief 是否是数字
 */
- (BOOL)validateNumber;

/**
 * @brief 是否是小数
 */
- (BOOL)isPureFloat;

/**
 *判断是不是九宫格
 *@return YES(是九宫格拼音键盘)
 */
-(BOOL)isNineKeyBoard;

/**
 *判断字符串是否含有表情
 *
 */
- (BOOL)stringContainsEmoji;

/**
 *截取字符串
 *
 */
+ (NSString *)cutWithString:(NSString *)aString type:(NSInteger)aType index:(NSInteger)aIndex;

/**
 @param number 待操作字符串
 @param range 密文展示的字符位置 range值第一个参数是第几位开始展示*，第二个参数是展示*的字符个数
 @return 处理后返回值
 */
+ (NSString *)numberSuitScanf:(NSString*)number range:(NSRange)range;
/**
*格式化金额
*
*/
- (NSString *)transfrormFormatMoney;

/**
 *  计算字符串的 MD5
 *
 *  @return MD5
 */
- (NSString *)MD5;

/**
 获取url的所有参数
 @param url 需要提取参数的url
 @return NSDictionary
 */
+(NSDictionary *) parameterWithURL:(NSString *) url;


@end

NS_ASSUME_NONNULL_END
