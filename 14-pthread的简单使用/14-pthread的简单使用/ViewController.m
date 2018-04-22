//
//  ViewController.m
//  14-pthread的简单使用
//
//  Created by zkinc on 2018/4/20.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(id)sender {
    
    NSLog(@"%@",[NSThread currentThread]);
    
    pthread_t thread;
    
    pthread_create(&thread, NULL,task, NULL);
    
    pthread_t threadB;
    
    pthread_create(&threadB, NULL,task, NULL);
    
}

void *task(void *param)
{
    NSLog(@"%@---------",[NSThread currentThread]);
    return NULL;
}

@end
