//
//  GesturesViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "GesturesViewController.h"

@interface GesturesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIButton *informationCardBtn;
@end

@implementation GesturesViewController {
    NSMutableArray *_arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    _arr = [NSMutableArray new];
    for (int i = 0; i<31; i++) {
        [_arr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(RightBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setTitle:@"编辑" forState:UIControlStateNormal];
    [informationCardBtn setTitleColor:kRandomColor forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    self.informationCardBtn = informationCardBtn;
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.mainTableView.backgroundColor = kRandomColor;
    self.mainTableView.allowsMultipleSelectionDuringEditing = true;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self.view addSubview:self.mainTableView];
}

- (void)RightBtnCLick:(UIButton *)btn {
    if (self.mainTableView.isEditing) {
        [self.informationCardBtn setTitle:@"编辑" forState:UIControlStateNormal];
    }
    else {
        [self.informationCardBtn setTitle:@"取消" forState:UIControlStateNormal];
    }
    [self.mainTableView setEditing:!self.mainTableView.isEditing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"111"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"111"];
    }
    
    cell.textLabel.text = _arr[indexPath.row];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

//是否允许多指选中
- (BOOL)tableView:(UITableView *)tableView shouldBeginMultipleSelectionInteractionAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

//多指选中开始，这里可以做一些UI修改，比如修改导航栏上按钮的文本
- (void)tableView:(UITableView *)tableView didBeginMultipleSelectionInteractionAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"---多选cell操作");
    [self.informationCardBtn setTitle:@"取消" forState:UIControlStateNormal];
    
}

@end
