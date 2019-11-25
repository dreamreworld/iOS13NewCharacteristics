//
//  ViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/10/30.
//  Copyright © 2019 scj. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "GesturesViewController.h"
#import "MenusViewController.h"
#import "KVCViewController.h"
#import "PresentViewController.h"
#import "UIActivityUndicatorViewController.h"
#import "StatusBarViewController.h"
#import "NSAttributedStringViewController.h"
#import "CGColorViewController.h"
#import "GainStyleViewController.h"
#import "ImageViewController.h"
#import "UIColorViewController.h"
#import "SegmentedViewController.h"


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation ViewController {
    NSArray *_arr;
    NSArray *_sectionArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"iOS13新特性";
    [self setupDataSource];
    [self setupSubViews];
    
    
}

- (void)setupDataSource {
    _arr = @[@[@"UIColor动态属性",@"图片适配",@"模式获取、设置及模式切换",@"CGColor适配",@"NSAttributedString优化",],@[@"Status Bar设置",@"UIActivityIndicatorView",@"模态视图变化",@"KVC不允许使用私有方法",@"Menus控件",@"Gestures新特性",@"Search新特性",@"UISegmentedControl"]];
    
    _sectionArr = @[@"暗黑模式适配",@"其他特性"];
}


- (void)setupSubViews {
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.mainTableView.backgroundColor = kRandomColor;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self.view addSubview:self.mainTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_arr[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    
    cell.textLabel.text = _arr[indexPath.section][indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionView = [[UIView alloc] init];
    sectionView.backgroundColor = kRandomColor;
    UILabel *sectionLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, kScreenWidth, 40)];
    sectionLabel.font = [UIFont systemFontOfSize:20];
    sectionLabel.text = _sectionArr[section];
    [sectionView addSubview:sectionLabel];
    return sectionView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            UIColorViewController *colorVC = [[UIColorViewController alloc] init];
            colorVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:colorVC animated:YES];
        }
        else if (indexPath.row == 1) {
            
            ImageViewController *imageVC = [[ImageViewController alloc] init];
            imageVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:imageVC animated:YES];
        }
        else if (indexPath.row == 2) {
            
            GainStyleViewController *gainVC = [[GainStyleViewController alloc] init];
            gainVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:gainVC animated:YES];
        }
        else if (indexPath.row == 3) {
            
            CGColorViewController *cgColorVC = [[CGColorViewController alloc] init];
            cgColorVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:cgColorVC animated:YES];
        }
        else if (indexPath.row == 4) {
            
            NSAttributedStringViewController *nsaVC = [[NSAttributedStringViewController alloc] init];
            nsaVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:nsaVC animated:YES];
        }
    }
    else {
        if (indexPath.row == 0) {
            
            StatusBarViewController *statusVC = [[StatusBarViewController alloc] init];
            statusVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:statusVC animated:YES];
        }
        else if (indexPath.row == 1) {
            
            UIActivityUndicatorViewController *activityVC = [[UIActivityUndicatorViewController alloc] init];
            activityVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:activityVC animated:YES];
        }
        else if (indexPath.row == 2) {
            
            PresentViewController *presentVC = [[PresentViewController alloc] init];
            presentVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:presentVC animated:YES];
        }
        else if (indexPath.row == 3) {
            
            KVCViewController *kvcVC = [[KVCViewController alloc] init];
            kvcVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:kvcVC animated:YES];
        }
        else if (indexPath.row == 4) {
            
            MenusViewController *menusVC = [[MenusViewController alloc] init];
            menusVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:menusVC animated:YES];
        }
        else if (indexPath.row == 5) {
            
            GesturesViewController *gesturesVC = [[GesturesViewController alloc] init];
            gesturesVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:gesturesVC animated:YES];
        }
        else if (indexPath.row == 6) {
            
            SearchViewController *searchVC = [[SearchViewController alloc] init];
            searchVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:searchVC animated:YES];
        }
        else if (indexPath.row == 7) {
            
            SegmentedViewController *segmentedVC = [[SegmentedViewController alloc] init];
            segmentedVC.navTitle = _arr[indexPath.section][indexPath.row];
            [self.navigationController pushViewController:segmentedVC animated:YES];
        }
    }
}


@end
