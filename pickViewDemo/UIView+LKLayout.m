//
//  UIView+LKLayout.m
//  StudentPlatform
//
//  Created by 李康康 on 2018/11/13.
//  Copyright © 2018年 李康康. All rights reserved.
//

#import "UIView+LKLayout.h"

@implementation UIView (LKLayout)

- (CGFloat)lk_left {
    return self.frame.origin.x;
}

- (void)setLk_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)lk_top {
    return self.frame.origin.y;
}

- (void)setLk_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)lk_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setLk_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)lk_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setLk_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)lk_width {
    return self.frame.size.width;
}

- (void)setLk_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)lk_height {
    return self.frame.size.height;
}

- (void)setLk_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)lk_centerX {
    return self.center.x;
}

- (void)setLk_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)lk_centerY {
    return self.center.y;
}

- (void)setLk_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)lk_origin {
    return self.frame.origin;
}

- (void)setLk_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)lk_size {
    return self.frame.size;
}

- (void)setLk_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGFloat)lk_middleX {
    
    return CGRectGetWidth(self.bounds) / 2.f;
}

- (CGFloat)lk_middleY {
    
    return CGRectGetHeight(self.bounds) / 2.f;
}

- (CGPoint)lk_middlePoint {
    
    return CGPointMake(CGRectGetWidth(self.bounds) / 2.f, CGRectGetHeight(self.bounds) / 2.f);
}

+ (UIFont *)adjustFont:(CGFloat )fontsize {
    if (@available(iOS 8.2, *)) {
        return [self adjustFont:fontsize weight:UIFontWeightRegular];
    } else {
        return [UIFont systemFontOfSize:[self adjustFontSize:fontsize]];
    }
}

+ (UIFont *)adjustFont:(CGFloat )fontsize fontFlag:(NSInteger)flag
{
    switch (flag) {
        case 0:
            return [self adjustFont:fontsize];
        case 1:
            return [UIView adjustFont:fontsize weight:UIFontWeightMedium];
        case 2:
            return  [UIView adjustFont:fontsize weight:UIFontWeightSemibold];
        case 3:
            return  [UIView adjustFont:fontsize weight:UIFontWeightBold];
        default:
            return [self adjustFont:fontsize];
            break;
    }
}

+ (UIFont *)adjustFont:(CGFloat )fontsize weight:(CGFloat )weight{
    if (@available(iOS 8.2, *)) {
        return [UIFont systemFontOfSize:[self adjustFontSize:fontsize] weight:weight];
    } else {
        return [UIFont systemFontOfSize:[self adjustFontSize:fontsize]];
    }
}

+ (CGFloat )adjustFontSize:(CGFloat )size{
    if (SCREEN_WIDTH == 320)
    {
        return size - 2;
    }else if (SCREEN_WIDTH == 375)
    {
        return size;
    }
    else if (IS_IPAD) {
        return size + 4;
    }
    else
    {
        return size + 2;
    }
}

+ (CGFloat)adjustWidth:(CGFloat)width {
    return width / 375.0 * SCREEN_WIDTH;
}

+ (CGFloat)adjustHeight:(CGFloat)height {
    if (IS_IPHONE_X) {
        return height;
    }
    return height / 667 * SCREEN_HEIGHT;
}

@end
