//
//  UIView+LKExtend.h
//  StudentPlatform
//
//  Created by 李康康 on 2018/11/13.
//  Copyright © 2018年 李康康. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LKExtend)

/**
 *  CGAffineTransformMakeScale
 */
@property (nonatomic) CGFloat  lk_scale;

/**
 *  CGAffineTransformMakeRotation
 */
@property (nonatomic) CGFloat  lk_angle;
/**
 * @brief 获取屏幕当前显示的ViewController
 */
+ (UIViewController *)currentUIViewController;
/**
 * @brief 得到view上的控制器.
 */
- (UIViewController *)superViewController;

- (void)removeAllSubviews;

/**
 *  设置部分圆角(绝对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii;
/**
 *  设置部分圆角(相对布局)
 *
 *  @param corners 需要设置为圆角的角 UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
 *  @param radii   需要设置的圆角大小 例如 CGSizeMake(20.0f, 20.0f)
 *  @param rect    需要设置的圆角view的rect
 */
- (void)addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGSize)radii
                 viewRect:(CGRect)rect;

/**
 * @brief 添加带线的阴影[self dropShadowWithOffset:CGSizeMake(0, -0.5)
 radius:1
 color:[UIColor grayColor]
 opacity:0.3];
 */
- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity;
//添加圆角阴影
+ (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowRadius:(CGFloat)shadowRadius
        andCornerRadius:(CGFloat)cornerRadius;

// 画虚线
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor;

- (void)imageViewShowAnimation;

- (UIImage *)nomalSnapshotImage;


@end

NS_ASSUME_NONNULL_END
