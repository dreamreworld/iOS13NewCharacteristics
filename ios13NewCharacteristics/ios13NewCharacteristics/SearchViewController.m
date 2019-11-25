//
//  SearchViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "SearchViewController.h"
#import "TableViewController.h"

@interface SearchViewController ()<UISearchControllerDelegate,UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITextField *field;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UITableView *mainTableView;
@end

@implementation SearchViewController {
    NSMutableArray *_arr;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationItem.hidesSearchBarWhenScrolling = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    [self setupSubViews];
}

- (void)setupSubViews {
    
    _arr = [NSMutableArray new];
    for (int i = 0; i<31; i++) {
        [_arr addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    self.mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.mainTableView.allowsMultipleSelectionDuringEditing = true;
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    
    [self.view addSubview:self.mainTableView];
    
    TableViewController *tab =[[TableViewController alloc]init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:tab];
    self.searchController.searchResultsUpdater = tab;
    self.searchController.delegate = self;
    [self.searchController.searchBar sizeToFit];
    self.definesPresentationContext = YES;
    if(@available(iOS 11.0, *)) {
        self.navigationItem.searchController = self.searchController;
    }else {
        self.mainTableView.tableHeaderView=self.searchController.searchBar;
    }
    self.navigationItem.hidesSearchBarWhenScrolling = NO;
    
    [self.searchController.searchBar.searchTextField insertToken:[UISearchToken tokenWithIcon:[UIImage imageNamed:@"ic_aa"] text:@"North"] atIndex:0];
    
    self.field = self.searchController.searchBar.searchTextField;
    self.field.textColor = kRandomColor;
    self.field.font = [UIFont systemFontOfSize:20];
    
    
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

@end
