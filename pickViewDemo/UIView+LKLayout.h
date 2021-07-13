//
//  UIView+LKLayout.h
//  StudentPlatform
//
//  Created by 李康康 on 2018/11/13.
//  Copyright © 2018年 李康康. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//状态栏高度
#define LKStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//获取导航栏+状态栏的高度
#define GetHeightNavAndStatusHight LKStatusBarHeight + self.navigationController.navigationBar.frame.size.height
//底部距离
#define TABBAR_BOTTOM_HEIGHT (IS_IPHONE_X ? 35 : 0)
//tabar高度
#define TABBAR_HEIGHT (IS_IPHONE_X ? 83 : 48)
//导航栏高度
#define NAVIGATION_BAR_HEIGHT (IS_IPHONE_X ? 88 : 64)
#define IS_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})
#define IS_IPAD ([UIScreen mainScreen].bounds.size.height == 1024.0f)
#define ScreenScale ([UIScreen mainScreen].scale)
#define ONE_PIXEL (1.0f/ScreenScale)

#define Font(s) [UIView adjustFont:s fontFlag:0]
#define FontM(s) [UIView adjustFont:s fontFlag:1]
#define FontS(s) [UIView adjustFont:s fontFlag:2]
#define FontB(s) [UIView adjustFont:s fontFlag:3]

/**转换成当前比例的数*/
#define AdjustWidth(x) [UIView adjustWidth:x]
#define AdjustHeight(x) [UIView adjustHeight:x]

#define LKHEXCOLOR(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface UIView (LKLayout)

@property (nonatomic) CGFloat lk_left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat lk_top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat lk_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat lk_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat lk_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat lk_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat lk_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat lk_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint lk_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  lk_size;
@property (nonatomic, readonly) CGFloat lk_middleX;
@property (nonatomic, readonly) CGFloat lk_middleY;
@property (nonatomic, readonly) CGPoint lk_middlePoint;

+ (UIFont *)adjustFont:(CGFloat )fontsize;

+ (UIFont *)adjustFont:(CGFloat )fontsize fontFlag:(NSInteger)flag;

+ (UIFont *)adjustFont:(CGFloat )fontsize weight:(CGFloat )weight;

+ (CGFloat )adjustFontSize:(CGFloat )size;

/**
 * @brief 得到对应屏幕宽度.
 * @param width 宽度
 */
+ (CGFloat)adjustWidth:(CGFloat)width;
/**
 * @brief 得到对应屏幕高度.
 * @param height 高度
 */
+ (CGFloat)adjustHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
