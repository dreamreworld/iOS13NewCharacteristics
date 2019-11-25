//
//  CGColorViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/4.
//  Copyright © 2019 scj. All rights reserved.
//

#import "CGColorViewController.h"

@interface CGColorViewController ()

@property (nonatomic, strong) CAGradientLayer *layer;
@property (nonatomic, strong) CAGradientLayer *layer2;
@end

@implementation CGColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    [self setupSubViews];
}

- (void)setupSubViews {
    
    //1、创建label
    UILabel *label = [[UILabel alloc] init];
    label.text = @"颜色渐变";
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:label];
    //2、创建渐变图层
    self.layer = [CAGradientLayer layer];
    self.layer.frame = CGRectMake(100, 300, kScreenWidth - 200, 50);
    self.layer.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    self.layer.locations = @[@0.5,@0.8];
    [self.view.layer addSublayer:self.layer];
    //3、设置遮罩
    self.layer.mask = label.layer;
    label.frame = self.layer.bounds;
    
    //1、创建label
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"颜色渐变";
    label2.textAlignment = NSTextAlignmentCenter;
    label2.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:label2];
    //2、创建渐变图层
    self.layer2 = [CAGradientLayer layer];
    self.layer2.frame = CGRectMake(100, 400, kScreenWidth - 200, 50);
    self.layer2.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
    self.layer2.locations = @[@0.5,@0.8];
    [self.view.layer addSublayer:self.layer2];
    //3、设置遮罩
    self.layer2.mask = label2.layer;
    label2.frame = self.layer2.bounds;
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    [super traitCollectionDidChange:previousTraitCollection];

    UIColor *dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
            return [UIColor redColor];
        }
        else {
            return kRandomColor;
        }
    }];

    UIColor *dyColor2 = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull traitCollection) {
        if ([traitCollection userInterfaceStyle] == UIUserInterfaceStyleLight) {
            return [UIColor greenColor];
        }
        else {
            return kRandomColor;
        }
    }];

    /**
    方法一：resolvedColorWithTraitCollection 上一次的模式
    */
//    UIColor *resolvedColor = [dyColor resolvedColorWithTraitCollection:previousTraitCollection];
//    UIColor *resolvedColor2 = [dyColor2 resolvedColorWithTraitCollection:previousTraitCollection];
//    self.layer.colors = @[(__bridge id)resolvedColor.CGColor,(__bridge id)resolvedColor2.CGColor];

    /**
     方法二：performAsCurrentTraitCollection
     */
//    [self.traitCollection performAsCurrentTraitCollection:^{
//        self.layer.colors = @[(__bridge id)dyColor.CGColor,(__bridge id)dyColor2.CGColor];
//    }];

    /**
     方法三：直接设置
     */
    self.layer.colors = @[(__bridge id)dyColor.CGColor,(__bridge id)dyColor2.CGColor];


    if (@available(iOS 13.0, *)) {
        if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
            self.layer2.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
        }
        else {
            self.layer2.colors = @[(__bridge id)kRandomColor.CGColor,(__bridge id)kRandomColor.CGColor];
        }
    }
}

@end
