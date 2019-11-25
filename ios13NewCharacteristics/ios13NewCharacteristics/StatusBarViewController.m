//
//  StatusBarViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "StatusBarViewController.h"

@interface StatusBarViewController ()

@end

@implementation StatusBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    
}

//状态栏
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDarkContent;;
}


@end
