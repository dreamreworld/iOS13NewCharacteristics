//
//  GainStyleViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "GainStyleViewController.h"
#import "ForceViewController.h"
#import "ForcePresentViewController.h"

@interface GainStyleViewController ()

@property (nonatomic, strong) UILabel *changeLabel;
@end

@implementation GainStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? [UIColor blackColor] : [UIColor whiteColor];
    [self setupSubViews];
}

- (void)setupSubViews {
    
    self.changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 200, kScreenWidth - 200, 60)];
    self.changeLabel.text = @"系统模式变了";
    self.changeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.changeLabel];
    
    //获取当前系统模式
    if (UITraitCollection.currentTraitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        NSLog(@"----UIUserInterfaceStyleDark");
    }
    else {
        NSLog(@"----UIUserInterfaceStyleLight/Default");
    }
    
    UIButton *forceBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forceBtn.frame = CGRectMake(100, 300, kScreenWidth - 200, 50);
    forceBtn.layer.cornerRadius = 25;
    forceBtn.backgroundColor = kRandomColor;
    [forceBtn setTitle:@"Dark Mode" forState:UIControlStateNormal];
    [forceBtn addTarget:self action:@selector(forceBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forceBtn];
    
    UIButton *navBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    navBtn.frame = CGRectMake(20, 400, kScreenWidth - 40, 50);
    navBtn.layer.cornerRadius = 25;
    navBtn.backgroundColor = kRandomColor;
    [navBtn setTitle:@"当前界面强制模式不会影响二级界面" forState:UIControlStateNormal];
    [navBtn addTarget:self action:@selector(navBtnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:navBtn];
    
    UIButton *presentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    presentBtn.frame = CGRectMake(20, 500, kScreenWidth - 40, 50);
    presentBtn.layer.cornerRadius = 25;
    presentBtn.backgroundColor = kRandomColor;
    [presentBtn setTitle:@"当前界面强制模式不会影响模态界面" forState:UIControlStateNormal];
    [presentBtn addTarget:self action:@selector(presentBtnBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:presentBtn];
}

//监听系统x模式变化
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    //判断两个UITraitCollection对象是否不同
    if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
        self.changeLabel.textColor = kRandomColor;
        self.changeLabel.backgroundColor = kRandomColor;
    }
    
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? [UIColor blackColor] : [UIColor whiteColor];
    }
}

- (void)forceBtnClick {
    [self setOverrideUserInterfaceStyle:UIUserInterfaceStyleDark];
}

- (void)navBtnBtnClick {
    ForceViewController *forceVC = [[ForceViewController alloc] init];
    [self.navigationController pushViewController:forceVC animated:YES];
}

- (void)presentBtnBtnClick {
    ForcePresentViewController *forcePresentVC = [[ForcePresentViewController alloc] init];
    [self presentViewController:forcePresentVC animated:YES completion:nil];
}

@end
