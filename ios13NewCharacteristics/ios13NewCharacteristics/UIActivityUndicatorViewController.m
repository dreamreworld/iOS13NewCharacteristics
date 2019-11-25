//
//  UIActivityUndicatorViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "UIActivityUndicatorViewController.h"

@interface UIActivityUndicatorViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *loadingView;
@property (nonatomic, strong) UIActivityIndicatorView *loadingView2;

@end

@implementation UIActivityUndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    
    //loading
    self.loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    [self.loadingView setFrame:CGRectMake(100, 300, kScreenWidth -200, 100)];
    [self.view addSubview:self.loadingView];
    [self.loadingView startAnimating];

    self.loadingView2 = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
    [self.loadingView2 setColor:[UIColor redColor]];
    [self.loadingView2 setFrame:CGRectMake(100, 400, kScreenWidth -200, 50)];
    [self.view addSubview:self.loadingView2];
    [self.loadingView2 startAnimating];
}

@end
