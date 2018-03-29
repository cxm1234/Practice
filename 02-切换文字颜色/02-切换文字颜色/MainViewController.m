//
//  MainViewController.m
//  02-切换文字颜色
//
//  Created by xiaoming on 2018/3/25.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property(nonatomic,weak)IBOutlet UILabel *label;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)clickRedButton{
    NSLog(@"%s",__func__);
    self.label.textColor = [UIColor redColor];
    self.label.text = @"我是一段红色的文字";
    self.label.backgroundColor = [UIColor yellowColor];
}

- (IBAction)clickGreenButton{
    NSLog(@"%s",__func__);
    self.label.textColor = [UIColor greenColor];
    self.label.text = @"我是一段绿的文字";
    self.label.backgroundColor = [UIColor redColor];
}

- (IBAction)clickBlueButton{
    NSLog(@"%s",__func__);
    self.label.textColor = [UIColor blueColor];
    self.label.text = @"我是一段蓝色的文字";
    self.label.backgroundColor = [UIColor whiteColor];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
