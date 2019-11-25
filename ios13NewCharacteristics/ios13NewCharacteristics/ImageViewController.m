//
//  ImageViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 400, kScreenWidth - 200, 60)];
    imageView.image = [UIImage imageNamed:@"icon_img"];

    [self.view addSubview:imageView];
}

@end
