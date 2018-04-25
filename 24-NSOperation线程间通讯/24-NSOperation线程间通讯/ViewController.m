//
//  ViewController.m
//  24-NSOperation线程间通讯
//
//  Created by zkinc on 2018/4/24.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

//@property(nonatomic, strong) UIImage *image1;
//
//@property(nonatomic, strong) UIImage *image2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


//http://i.meizitu.net/2018/04/22c03.jpg
//http://i1.umei.cc/uploads/tu/201803/9999/47f863441d.jpg
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
 
    //开子线程下载
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    __block UIImage *image1;
    __block UIImage *image2;
    
    NSBlockOperation *download1 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://www.feizl.com/upload2007/2013_02/130228020453111.jpg"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        NSLog(@"download --- %@",[NSThread currentThread]);
        image1 = image;
    }];
    
    NSBlockOperation *download2 = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://www.feizl.com/upload2007/2013_06/130618021596611.jpg"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        NSLog(@"download --- %@",[NSThread currentThread]);
        image2 = image;
    }];
    
    NSBlockOperation *combie = [NSBlockOperation blockOperationWithBlock:^{
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        [image1 drawInRect:CGRectMake(0, 0, 100, 200)];
        [image2 drawInRect:CGRectMake(100, 0, 100, 200)];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
        }];
    }];
    
    [combie addDependency:download1];
    [combie addDependency:download2];
    
    [queue addOperation:download1];
    [queue addOperation:download2];
    [queue addOperation:combie];
    
}


- (void)test
{
    //开子线程下载
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSBlockOperation *download = [NSBlockOperation blockOperationWithBlock:^{
        NSURL *url = [NSURL URLWithString:@"http://i1.umei.cc/uploads/tu/201803/9999/47f863441d.jpg"];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        NSLog(@"download --- %@",[NSThread currentThread]);
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = image;
            NSLog(@"UI --- %@",[NSThread currentThread]);
        }];
    }];
    
    [queue addOperation:download];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
