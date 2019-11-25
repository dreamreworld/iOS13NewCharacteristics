//
//  MenuShowViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/7.
//  Copyright © 2019 scj. All rights reserved.
//

#import "MenuShowViewController.h"

@interface MenuShowViewController ()

@end

@implementation MenuShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kRandomColor;
//    [self setupSubviews];
}

- (void)setupSubviews {
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 50)];
//    label.text = @"弹出Menu";
//    label.textColor = kRandomColor;
//    label.font = [UIFont systemFontOfSize:20];
//    [self.view addSubview:label];
//
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(50, 150, 200, 50);
//    btn.layer.cornerRadius = 25;
//    btn.titleLabel.font = [UIFont systemFontOfSize:20];
//    btn.backgroundColor = kRandomColor;
//    [btn setTitle:@"按钮点击" forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

- (void)btnClick {
    NSLog(@"---btnClick");
}

@end
