//
//  NSAttributedStringViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "NSAttributedStringViewController.h"

@interface NSAttributedStringViewController ()

@end

@implementation NSAttributedStringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    
    UILabel *attributeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 500, kScreenWidth - 200, 50)];
    attributeLabel.textAlignment = NSTextAlignmentCenter;
    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:30],NSForegroundColorAttributeName:[UIColor labelColor]};
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"富文本文案" attributes:dic];
    attributeLabel.attributedText = str;
    
    [self.view addSubview:attributeLabel];
}

@end
