//
//  SecondViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/10/30.
//  Copyright © 2019 scj. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@property (nonatomic, strong) CAGradientLayer *layer;
@property (nonatomic, strong) CAGradientLayer *layer2;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    [self setOverrideUserInterfaceStyle:UIUserInterfaceStyleDark];
    
    self.navigationItem.title = @"第二页";
    self.view.backgroundColor = kRandomColor;
    
    NSLog(@"viewDidLoad:%@",NSStringFromCGSize(self.view.bounds.size));
    
    [self setupSubViews];
}

- (void)setupSubViews {
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn.frame = CGRectMake(40, kScreenHeight - 200, kScreenWidth - 80, 50);
    [navBtn setTitle:@"模态" forState:UIControlStateNormal];
    navBtn.layer.cornerRadius = 25;
    navBtn.layer.masksToBounds = YES;
    navBtn.backgroundColor = kRandomColor;
    [navBtn addTarget:self action:@selector(navBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:navBtn];
}

- (void)navBtnClick {
    ThirdViewController *thirdVC = [[ThirdViewController alloc] init];
    
    [self presentViewController:thirdVC animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"viewWillAppear:%@",NSStringFromCGSize(self.view.bounds.size));
    
    NSLog(@"-presentVC:viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"-presentVC:viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"-presentVC:viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"-presentVC:viewDidDisappear");
}

@end
