//
//  ThirdViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/10/30.
//  Copyright © 2019 scj. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (instancetype)init {
    if (self = [super init]) {
        self.modalPresentationStyle = UIModalPresentationFullScreen;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第三页";
    self.view.backgroundColor = [UIColor greenColor];
    
    [self setupSubViews];
    
    NSLog(@"viewDidLoad:%@",NSStringFromCGSize(self.view.bounds.size));
}

- (void)setupSubViews {
    
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn.frame = CGRectMake(40, kScreenHeight - 200, kScreenWidth - 80, 50);
    [navBtn setTitle:@"返回" forState:UIControlStateNormal];
    navBtn.layer.cornerRadius = 25;
    navBtn.layer.masksToBounds = YES;
    navBtn.backgroundColor = kRandomColor;
    [navBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:navBtn];
}

- (void)backBtnClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear:%@",NSStringFromCGSize(self.view.bounds.size));
    
    NSLog(@"-present3VC:viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"-present3VC:viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"-present3VC:viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"-present3VC:viewDidDisappear");
}

@end
