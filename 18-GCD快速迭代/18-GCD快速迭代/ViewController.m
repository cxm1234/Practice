//
//  ViewController.m
//  18-GCD快速迭代
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

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self moveFileWithGCD];
}


- (void)apply{
    
    //
    dispatch_apply(10, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(size_t index) {
        NSLog(@"%zd-----%@",index,[NSThread currentThread]);
    });
}

- (void)moveFile
{
    NSString *from = @"/Users/zkinc/Desktop/from";
    NSString *to = @"/Users/zkinc/Desktop/to";
    NSArray *subPaths = [[NSFileManager defaultManager] subpathsAtPath:from];
    NSInteger count = subPaths.count;
    for (int i = 0; i < count; i++) {
        NSString *fullPath = [from stringByAppendingPathComponent:subPaths[i]];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPaths[i]];
        NSLog(@"%@  to  %@ thread  %@",fullPath,toFullPath,[NSThread currentThread]);
        
        [[NSFileManager defaultManager] copyItemAtPath:toFullPath toPath:fullPath error:nil];
//        [[NSFileManager defaultManager] moveItemAtPath:fullPath toPath:toFullPath error:nil];
    }
    
}

- (void)moveFileWithGCD
{
    NSString *from = @"/Users/zkinc/Desktop/from";
    NSString *to = @"/Users/zkinc/Desktop/to";
    NSArray *subPaths = [[NSFileManager defaultManager] subpathsAtPath:from];
    NSInteger count = subPaths.count;
    
    dispatch_apply(count, dispatch_get_global_queue(0, 0), ^(size_t index) {
        NSString *fullPath = [from stringByAppendingPathComponent:subPaths[index]];
        NSString *toFullPath = [to stringByAppendingPathComponent:subPaths[index]];
        [[NSFileManager defaultManager] copyItemAtPath:fullPath toPath:toFullPath error:nil];
        NSLog(@"%@  to  %@ thread  %@",fullPath,toFullPath,[NSThread currentThread]);
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
