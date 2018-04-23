//
//  ViewController.m
//  17-GCD栅栏函数
//
//  Created by zkinc on 2018/4/23.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_queue_t queue = dispatch_queue_create("download", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i < 100; i++) {
             NSLog(@"download1 ----- %@ ------ %d",[NSThread currentThread],i);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"download2 ----- %@ ------ %d",[NSThread currentThread],i);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"download3 ----- %@ ------ %d",[NSThread currentThread],i);
        }
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"+++++++++++++++++++++++++++++++++++++++++++");
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"download4 ----- %@ ------ %d",[NSThread currentThread],i);
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 100; i++) {
            NSLog(@"download5 ----- %@ ------ %d",[NSThread currentThread],i);
        }
    });
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
