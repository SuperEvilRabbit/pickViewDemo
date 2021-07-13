//
//  ViewController.m
//  pickViewDemo
//
//  Created by 李康康 on 2021/3/30.
//

#import "ViewController.h"
#import "UIView+LKLayout.h"
#import "LKTestPullView.h"
#define WeakSelf __weak typeof(self) weakSelf = self;
@interface ViewController ()

@property (nonatomic, strong) UIView * headView;

@property (nonatomic, strong) LKTestPullView * pullView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.title = @"DEMO";
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 80, 50);
    [btn setTitle:@"测试" forState:UIControlStateNormal];
    [btn setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickBtnAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickBtnAction{
    if (self.pullView.hidden){
        [self.pullView showAtView:self.view];
    }else{
        [self.pullView hiddenView];
    }
}

- (LKTestPullView *)pullView{
    if (!_pullView){
        _pullView = [[LKTestPullView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0)];
        _pullView.defaultHeight = 200;
    }
    return _pullView;
}

@end
