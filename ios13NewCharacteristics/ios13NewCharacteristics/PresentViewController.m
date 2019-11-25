//
//  PresentViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "PresentViewController.h"
#import "SecondViewController.h"

@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    
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
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    [self presentViewController:secondVC animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"-VC:viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"-VC:viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"-VC:viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"-VC:viewDidDisappear");
}

@end
