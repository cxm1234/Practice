//
//  ViewController.m
//  11-分页控件
//
//  Created by xiaoming on 2018/4/5.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "ViewController.h"
#import "CCPageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CCPageView *pageView = [CCPageView pageView];
    pageView.center = self.view.center;
    pageView.imageNames = @[@"img_01",@"img_02",@"img_03",@"img_04",@"img_05"];
    [self.view addSubview:pageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
