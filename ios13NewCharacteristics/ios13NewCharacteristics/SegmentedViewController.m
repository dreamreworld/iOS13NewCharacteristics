//
//  SegmentedViewController.m
//  iOS13Demo
//
//  Created by scj on 2019/11/11.
//  Copyright © 2019 scj. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

@property (nonatomic, strong) UISegmentedControl *segmentedControl;

@end

@implementation SegmentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.navTitle;
    self.view.backgroundColor = kRandomColor;
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"First",@"Second"]];
    segmentedControl.frame = CGRectMake(20, 200, 200, 50);
    segmentedControl.backgroundColor = [UIColor whiteColor];
    NSDictionary *dic = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    [segmentedControl setTitleTextAttributes:dic forState:UIControlStateNormal];
    segmentedControl.selectedSegmentTintColor = [UIColor redColor];
    [segmentedControl addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedControl];
    self.segmentedControl = segmentedControl;
}

- (void)segmentValueChanged:(UISegmentedControl *)segment {
    self.segmentedControl.selectedSegmentIndex = segment.selectedSegmentIndex;;
}

@end
