//
//  ViewController.m
//  03-UIView的常见属性
//
//  Created by xiaoming on 2018/3/25.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@     %@",self.blueView.superview,self.view);
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.view removeFromSuperview];
    NSLog(@"%@ -----",self.view.superview);
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
