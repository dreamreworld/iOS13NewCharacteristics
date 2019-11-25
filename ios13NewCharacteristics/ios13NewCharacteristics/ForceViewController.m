//
//  ForceViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/7.
//  Copyright © 2019 scj. All rights reserved.
//

#import "ForceViewController.h"

@interface ForceViewController ()

@end

@implementation ForceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kRandomColor;
    
    [self setupSubViews];
}

- (void)setupSubViews {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 400, kScreenWidth - 200, 60)];
    imageView.image = [UIImage imageNamed:@"icon_img"];
    
    [self.view addSubview:imageView];
}


//监听系统x模式变化
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];
    
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark ? [UIColor blackColor] : [UIColor whiteColor];
    }
}

@end
