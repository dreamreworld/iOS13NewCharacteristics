//
//  MenusViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "MenusViewController.h"
#import "MenuShowViewController.h"

@interface MenusViewController ()<UIContextMenuInteractionDelegate>

@property (nonatomic, weak) UILabel *scrLabel;
@property (nonatomic, assign) UIMenuOptions options;
@property (nonatomic, weak) UIButton *changeBtn;
@end

@implementation MenusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    
    [self setupSubViews];
}

- (void)setupSubViews {
    self.options = UIMenuOptionsDisplayInline;
    
    UIContextMenuInteraction *menuInteraction = [[UIContextMenuInteraction alloc] initWithDelegate:self];
    UIView *menuView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    menuView.backgroundColor = kRandomColor;
    [menuView addInteraction:menuInteraction];
    menuView.userInteractionEnabled = YES;
    
    UILabel *scrLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 100, 50)];
    scrLabel.text = @"DisplayInline";
    scrLabel.font = [UIFont systemFontOfSize:13];
    scrLabel.textColor = kRandomColor;
    [menuView addSubview:scrLabel];
    self.scrLabel = scrLabel;
    
    [self.view addSubview:menuView];
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.backgroundColor = kRandomColor;
    changeBtn.frame = CGRectMake(100, 250, 100, 50);
    changeBtn.layer.cornerRadius = 25;
    [changeBtn setTitle:@"切换" forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(changeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeBtn];
    self.changeBtn = changeBtn;
}

- (UIContextMenuConfiguration *)contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation:(CGPoint)location {
    return [UIContextMenuConfiguration configurationWithIdentifier:nil previewProvider:^UIViewController * _Nullable{
        return [[MenuShowViewController alloc] init];
    } actionProvider:^UIMenu * _Nullable(NSArray<UIMenuElement *> * _Nonnull suggestedActions) {
        
        UIMenu *menu = [UIMenu menuWithTitle:@"MenuItem" image:[UIImage imageNamed:@"ic_aa"] identifier:nil options:self.options children:@[[UIAction actionWithTitle:@"Share" image:[UIImage imageNamed:@"person_share"] identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
            NSLog(@"---menu-Share");
        }]]];
        
        return [UIMenu menuWithTitle:@"" children:@[
            [UIAction actionWithTitle:@"Link" image:[UIImage imageNamed:@"share_link"] identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
            NSLog(@"---menu-Link");
        }],
            menu,
            [UIAction actionWithTitle:@"🎁" image:[UIImage imageNamed:@"ic_huodong"] identifier:nil handler:^(__kindof UIAction * _Nonnull action) {
            NSLog(@"---menu-🎁");
        }]
        ]];
    }];
}

- (void)changeBtnClick {
    self.changeBtn.selected = !self.changeBtn.selected;
    if (self.changeBtn.selected) {
        self.scrLabel.text = @"Destructive";
        self.options = UIMenuOptionsDestructive;
    }
    else {
        self.scrLabel.text = @"DisplayInline";
        self.options = UIMenuOptionsDisplayInline;
    }
}

@end
