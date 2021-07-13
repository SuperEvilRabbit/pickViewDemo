//
//  LKPullUpView.m
//  pickViewDemo
//
//  Created by 李康康 on 2021/4/25.
//

#import "LKPullUpView.h"
#import "UIView+LKLayout.h"
@implementation LKPullUpView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.hidden = YES;
        _maxY = 0;
        _showLine = YES;
        _TopShowLine = YES;
    }
    return self;
}

- (void)setPullView:(UIScrollView *)pullView{
    _pullView = pullView;
    if (self.showLine){
        pullView.contentInset = UIEdgeInsetsMake(25, 0, 0, 0);
        UIView * lineBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, pullView.contentInset.top)];
        lineBackView.backgroundColor = UIColor.whiteColor;
        lineBackView.userInteractionEnabled = NO;
        self.pullView.contentOffset = CGPointMake(0, -pullView.contentInset.top);
        _lineBackView = lineBackView;
        [self addSubview:lineBackView];
        
        _line = [[UIView alloc] init];
        _line.backgroundColor = LKHEXCOLOR(0x979797);
        _line.layer.masksToBounds = YES;
        _line.layer.cornerRadius = 2;
        [lineBackView addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(4);
            make.width.mas_equalTo(28);
            make.center.mas_equalTo(lineBackView);
        }];
    }
    
    _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    _panGesture.delegate = self;
    
    [self addObserver:self forKeyPath:@"lk_top" options:NSKeyValueObservingOptionNew context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"lk_top"]) {
        if (!self.panGesture.view && !self.drag && self.lk_top != self.maxY){
            self.frame = CGRectMake(0, self.maxY, self.lk_width, self.superview.lk_height);
            CGSize cornSize = CGSizeZero;
            if (!self.hiddnCorn){
                cornSize = CGSizeMake(10,10);
            }
            [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:cornSize];
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.panGesture.view)
        return;
    CGFloat correctY = scrollView.contentOffset.y + scrollView.contentInset.top;
    if (correctY < 0){
        self.lk_top = self.lk_top - correctY;
        if (self.lk_top < self.maxY){
            self.lk_top = self.maxY;
        }
        [scrollView setContentOffset:CGPointMake(0, -scrollView.contentInset.top)];
    }else{
        if (self.lk_top < self.maxY ){
            self.lk_top = self.maxY;
            self.dragToTop = YES;
        }
        if (self.lk_top != self.maxY){
            self.lk_top = self.lk_top - correctY;
            [scrollView setContentOffset:CGPointMake(0, -scrollView.contentInset.top)];
        }else if (self.dragToTop){
            [scrollView setContentOffset:CGPointMake(0, -scrollView.contentInset.top)];
        }
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _drag = YES;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset API_AVAILABLE(ios(5.0)){
    self.drag = NO;
    self.dragToTop = NO;
    CGFloat top = self.maxY + 45;
    if (self.lk_top < top){
        CGSize cornSize = CGSizeZero;
        if (!self.hiddnCorn){
            cornSize = CGSizeMake(10,10);
        }
        [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:cornSize];
        self.originY = self.maxY;
        self.lk_height = self.superview.lk_height - self.maxY;
        [UIView animateWithDuration:0.2 animations:^{
            self.lk_top = self.maxY;
        }];
    }else if (self.lk_top > top && self.lk_top < self.frameY){
        self.originY = self.frameY;
        [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:CGSizeMake(10, 10)];
        [UIView animateWithDuration:0.2 animations:^{
            self.frame = CGRectMake(0, self.frameY, self.lk_width, self.lk_height);
        } completion:^(BOOL finished) {
            self.lk_height = self.originHeight;
        }];
        [self.pullView addGestureRecognizer:self.panGesture];
    }else{
        [self hiddenView];
    }
}

- (void)handlePanGesture:(UIPanGestureRecognizer *)panGesture {
    if (self.banPanGes){
        return;
    }
    
    CGPoint translation = [panGesture translationInView:panGesture.view];
    if (panGesture.state == UIGestureRecognizerStateBegan){

    }else if (panGesture.state == UIGestureRecognizerStateChanged){
        if (translation.y > 0){
            self.lk_top = self.originY + translation.y;
        }else{
            if (translation.y > -45){
                self.lk_top = self.originY + translation.y;
                if (self.lk_top <= self.maxY){
                    self.lk_top = self.maxY;
                }
                self.lk_height = self.superview.lk_height - self.lk_top;
            }else{
                self.lk_top = self.originY + translation.y;
                self.lk_height = self.superview.lk_height - self.maxY;
            }
            if (self.lk_top <= self.maxY){
                self.lk_top = self.maxY;
            }
            [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:CGSizeMake(10, 10)];
        }
    }else if (panGesture.state  == UIGestureRecognizerStateEnded){
        if (translation.y > 0){
            CGFloat top = self.maxY + 45;
            if (self.lk_top < top){
                [UIView animateWithDuration:0.2 animations:^{
                    self.lk_top = self.maxY;
                }];
            }else if (self.lk_top > top && self.lk_top < self.frameY){
                self.originY = self.frameY;
                [UIView animateWithDuration:0.3 animations:^{
                    self.lk_top = self.frameY;
                } completion:^(BOOL finished) {
                    self.lk_height = self.originHeight;
                    [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:CGSizeMake(10, 10)];
                }];
            }else if (self.lk_top > self.frameY  && self.lk_top < self.frameY + 45){
                self.originY = self.frameY;
                [UIView animateWithDuration:0.3 animations:^{
                    self.lk_top = self.frameY;
                } completion:^(BOOL finished) {
                    self.lk_height = self.originHeight;
                    [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:CGSizeMake(10, 10)];
                }];
            }
            else{
                [self hiddenView];
            }
        }else{
            if (translation.y < -45){
                self.originY = self.maxY;
                CGSize cornSize = CGSizeZero;
                if (!self.hiddnCorn){
                    cornSize = CGSizeMake(10,10);
                }
                [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:cornSize];
                [UIView animateWithDuration:0.2 animations:^{
                    self.lk_top = self.originY;
                } completion:^(BOOL finished) {
                    if(!self.TopShowLine){
                        self.lineBackView.hidden = YES;
                    }
                }];
                [self.pullView removeGestureRecognizer:self.panGesture];
            }else{
                [UIView animateWithDuration:0.2 animations:^{
                    self.lk_top = self.originY;
                } completion:^(BOOL finished) {
                    self.lk_height = self.originHeight;
                    [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:CGSizeMake(10, 10)];
                }];
            }
        }
    }
}

- (void)showAtView:(UIView *)superView{
    [superView addSubview:self];
    if(self.hidden == NO)
        return;
    self.hidden = NO;
    self.line.hidden = NO;
    _originHeight = _defaultHeight;
    self.frame = CGRectMake(0, superView.lk_height, self.lk_width, _originHeight);
    [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:CGSizeMake(10, 10)];
    if (!self.panGesture.view){
        [self.pullView addGestureRecognizer:_panGesture];
    }
    self.frameY = superView.lk_height - _originHeight;
    [UIView animateWithDuration:0.3 animations:^{
        self.lk_bottom = superView.lk_height;
        self.originY = self.lk_top;
    } completion:^(BOOL finished) {
        [self addRoundedCorners:UIRectCornerTopLeft | UIRectCornerTopRight  withRadii:CGSizeMake(10, 10)];
    }];
}

- (void)hiddenView{
    if (self.isHidden){
        return;
    }
    if (self.hiddenBlock){
        self.hiddenBlock();
    }
    [UIView animateWithDuration:0.3 animations:^{
        self.frame = CGRectMake(0, SCREEN_HEIGHT, self.lk_width, self.originHeight);
    } completion:^(BOOL finished) {
        self.hidden = YES;
        self.lk_height = self.originHeight;
        [self removeFromSuperview];
    }];
}

@end
