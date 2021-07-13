//
//  LKTestPullView.m
//  pickViewDemo
//
//  Created by 李康康 on 2021/4/25.
//

#import "LKTestPullView.h"

@interface LKTestPullView ()<UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView * tableView;

@end

@implementation LKTestPullView

- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.showLine = NO;
        self.hiddnCorn = NO;
        self.maxY = 0;
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.dataSource = self;
        [_tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.right.mas_equalTo(0);
            make.bottom.mas_equalTo(-TABBAR_BOTTOM_HEIGHT);
        }];
        self.pullView = self.tableView;
    }
    return self;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.row];
    cell.contentView.backgroundColor = UIColor.blueColor;
    cell.textLabel.textColor = UIColor.blackColor;
    return cell;;
}

@end
