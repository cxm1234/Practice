//
//  ViewController.m
//  22-NSOperation的其他用法
//
//  Created by zkinc on 2018/4/24.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import "ESOperation.h"

@interface ViewController ()
@property(nonatomic,strong)NSOperationQueue *queue;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self demo];
}
- (IBAction)start:(id)sender {
    
    self.queue = [[NSOperationQueue alloc] init];
    self.queue.maxConcurrentOperationCount = 1;
    
    ESOperation *operation = [[ESOperation alloc] init];
    
    [self.queue addOperation:operation];
    
}
- (IBAction)suspend:(id)sender {
    //暂停，是可以恢复
    
    [self.queue setSuspended:YES];
}
- (IBAction)goOn:(id)sender {
    [self.queue setSuspended:NO];
}
- (IBAction)cancel:(id)sender {
    [self.queue cancelAllOperations];
}

- (void)demo
{
    self.queue = [[NSOperationQueue alloc] init];
    self.queue.maxConcurrentOperationCount = 1;
   
    ESOperation *op1 = [[ESOperation alloc] init];
    
    [self.queue addOperation:op1];
}


- (void)test
{
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    queue.maxConcurrentOperationCount = 1;
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"1------%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2------%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"3------%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op4 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"4------%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op5 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"5------%@",[NSThread currentThread]);
    }];
    
    NSBlockOperation *op6 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"6------%@",[NSThread currentThread]);
    }];
    
    [queue addOperation:op1];
    
    [queue addOperation:op2];
    
    [queue addOperation:op3];
    
    [queue addOperation:op4];
    
    [queue addOperation:op5];
    
    [queue addOperation:op6];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
