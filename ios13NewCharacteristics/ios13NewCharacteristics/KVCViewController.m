//
//  KVCViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "KVCViewController.h"

@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    
    //去除kvc私有方法
    UITextField *field = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, kScreenWidth - 40, 50)];
    field.backgroundColor = kRandomColor;
    //    [field setValue:kRandomColor forKeyPath:@"_placeholderLabel.textColor"];//kvc私有方法已不允许了
    field.attributedPlaceholder = [[NSMutableAttributedString alloc] initWithString:@"请输入" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:23],NSForegroundColorAttributeName:kRandomColor}];
    
    [self.view addSubview:field];
    
    /**
     编辑手势
     复制：三指捏合
     剪切：两次三指捏合
     粘贴：三指松开
     撤销：三指向左滑动（或三指双击）
     重做：三指向右滑动
     快捷菜单：三指单击
     */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 160, kScreenWidth -40, 50)];
    label.font = [UIFont systemFontOfSize:23];
    label.text = @"复制：三指捏合";
    [self.view addSubview:label];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, kScreenWidth -40, 50)];
    label1.font = [UIFont systemFontOfSize:23];
    label1.text = @"剪切：两次三指捏合";
    [self.view addSubview:label1];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 280, kScreenWidth -40, 50)];
    label2.font = [UIFont systemFontOfSize:23];
    label2.text = @"粘贴：三指松开";
    [self.view addSubview:label2];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 340, kScreenWidth -40, 50)];
    label3.font = [UIFont systemFontOfSize:23];
    label3.text = @"撤销：三指向左滑动（或三指双击）";
    [self.view addSubview:label3];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(20, 400, kScreenWidth -40, 50)];
    label4.font = [UIFont systemFontOfSize:23];
    label4.text = @"重做：三指向右滑动";
    [self.view addSubview:label4];
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 460, kScreenWidth -40, 50)];
    label5.font = [UIFont systemFontOfSize:23];
    label5.text = @"快捷菜单：三指单击";
    [self.view addSubview:label5];
}

//禁用手势
//- (UIEditingInteractionConfiguration)editingInteractionConfiguration {
//    return UIEditingInteractionConfigurationNone;
//}

@end
