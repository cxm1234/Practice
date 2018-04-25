//
//  ESOperation.m
//  22-NSOperation的其他用法
//
//  Created by zkinc on 2018/4/24.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ESOperation.h"

@implementation ESOperation

-(void)main
{
    for (NSInteger i = 0; i < 10000; i ++) {
        if(self.isCancelled) return;
        NSLog(@"download 1 ---- %zd ----- %@",i,[NSThread currentThread]);
    }
    
    NSLog(@"++++++++++++++++++++++++++++++");
    
    for (NSInteger i = 0; i < 10000; i ++) {
        if(self.isCancelled) return;
        NSLog(@"download 2 ---- %zd ----- %@",i,[NSThread currentThread]);
    }
    
    
    NSLog(@"++++++++++++++++++++++++++++++");
    
    for (NSInteger i = 0; i < 10000; i ++) {
        if(self.isCancelled) return;
        NSLog(@"download 3 ---- %zd ----- %@",i,[NSThread currentThread]);
    }
    
   
    
    NSLog(@"++++++++++++++++++++++++++++++");
}

@end
