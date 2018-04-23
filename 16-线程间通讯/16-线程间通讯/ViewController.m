//
//  ViewController.m
//  16-线程间通讯
//
//  Created by xiaoming on 2018/4/22.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "ViewController.h"
//http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [NSThread detachNewThreadSelector:@selector(download) toTarget:self withObject:nil];
//    [self download];
}

- (void)download
{
//    NSDate *startDate = [NSDate date];
    
    NSLog(@"current thread %@",[NSThread currentThread]);
    
    NSURL *url = [NSURL URLWithString:@"http://img4.duitang.com/uploads/blog/201310/18/20131018213446_smUw4.thumb.700_0.jpeg"];
    
    CFTimeInterval start = CFAbsoluteTimeGetCurrent();
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    
    CFTimeInterval end = CFAbsoluteTimeGetCurrent();
    
    NSLog(@"end - start = %f",end - start);
    
    [self performSelectorOnMainThread:@selector(setImage:) withObject:imageData waitUntilDone:NO];
    
    NSLog(@"------ end ------");
}

- (void)setImage:(id)imageData
{
     self.imageView.image = [UIImage imageWithData:imageData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
