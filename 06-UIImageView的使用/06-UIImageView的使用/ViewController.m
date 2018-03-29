//
//  ViewController.m
//  06-UIImageView的使用
//
//  Created by xiaoming on 2018/3/27.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIImageView *imageView = [[UIImageView alloc] init];
//
//    imageView.frame = self.view.bounds;
//
//    imageView.backgroundColor = [UIColor redColor];
//
//    imageView.image = [UIImage imageNamed:@"1"];
//
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
//
//    UIToolbar *toolBar = [[UIToolbar alloc] init];
//
//    toolBar.alpha = 0.8;
//
//    toolBar.frame = imageView.frame;
//
//    [imageView addSubview:toolBar];
//
//    [self.view addSubview:imageView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    
    imageView.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    
    [self.view addSubview:imageView];
}


- (void)test{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(100, 100, 250, 200);
    
    UIImage *image = [UIImage imageNamed:@"1"];
    
    imageView.image = image;
    
    imageView.backgroundColor = [UIColor yellowColor];
    
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
