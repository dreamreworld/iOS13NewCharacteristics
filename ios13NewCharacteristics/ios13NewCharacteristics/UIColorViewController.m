//
//  UIColorViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "UIColorViewController.h"

@interface UIColorViewController ()

@end

@implementation UIColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(40, 100, kScreenWidth - 80, 40)];
    
    UIColor *topViewColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
            return [UIColor redColor];
        }
        else {
            return [UIColor greenColor];
        }
    }];
    topView.backgroundColor = topViewColor;

    [self.view addSubview:topView];
    

    UIColor *labelColor = [[UIColor alloc] initWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
            return [UIColor blackColor];
        }
        else {
            return [UIColor whiteColor];
        }
    }];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 200, kScreenWidth - 20, 100)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"label color";
    label.font = [UIFont systemFontOfSize:66];
    label.textColor = labelColor;

    [self.view addSubview:label];
}

@end
