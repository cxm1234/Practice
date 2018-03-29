//
//  ViewController.m
//  07-资源存放问题
//
//  Created by xiaoming on 2018/3/28.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"1" ofType:"png"];
    self.imageView.image = [UIImage imageWithContentsOfFile:path];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
