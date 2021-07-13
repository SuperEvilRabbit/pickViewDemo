//
//  LKPullUpView.h
//  pickViewDemo
//
//  Created by 李康康 on 2021/4/25.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "UIView+LKLayout.h"
#import "UIView+LKExtend.h"
NS_ASSUME_NONNULL_BEGIN

@interface LKPullUpView : UIView<UIGestureRecognizerDelegate>

//默认高度
@property (nonatomic, assign) CGFloat defaultHeight;
//是否在拖拽tableview
@property (nonatomic, assign) BOOL drag;
//tableview拖拽过程中到达顶部后禁止滚动
@property (nonatomic, assign) BOOL dragToTop;
//记录y值
@property (nonatomic, assign) CGFloat originY;
//原始高度
@property (nonatomic, assign) CGFloat originHeight;
//原始位置
@property (nonatomic, assign) CGFloat frameY;
//拖动手势
@property (nonatomic, strong) UIPanGestureRecognizer * panGesture;
//是否显示可拖拽的线
@property (nonatomic, assign) BOOL showLine;
//到达顶部是否隐藏线
@property (nonatomic, assign) BOOL TopShowLine;
//是否到达顶部隐藏圆角
@property (nonatomic, assign) BOOL hiddnCorn;
//禁止手势
@property (nonatomic, assign) BOOL banPanGes;
//tableView 或者 collection
@property (nonatomic, strong) UIScrollView * pullView;

@property (nonatomic, strong) UIView * lineBackView;

@property (nonatomic, strong) UIView * line;

@property (nonatomic, assign) CGFloat maxY;

@property (nonatomic, assign) CGFloat midY;

@property (nonatomic, copy) void(^hiddenBlock)(void);

@property (nonatomic, copy) void(^clickItemAction)(NSIndexPath * index ,NSString * _Nonnull title, NSInteger BtnTag);


- (void)showAtView:(UIView *)superView;

- (void)hiddenView;

@end

NS_ASSUME_NONNULL_END
