//
//  ViewController.m
//  19-GCD队列组的基本使用
//
//  Created by zkinc on 2018/4/23.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic, strong) UIImage *image1;

@property(nonatomic, strong) UIImage *image2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
    [self group2];
}

- (void)group1
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"1------%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"2------%@",[NSThread currentThread]);
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"3------%@",[NSThread currentThread]);
    });
    
    dispatch_group_notify(group, queue, ^{
        
        NSLog(@"dispatch_group_notify");
        
    });
}


- (void)group2
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, queue, ^{
        
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524476939077&di=96c3f8a7282783fab7a898e220f64849&imgtype=0&src=http%3A%2F%2Fh.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fcdbf6c81800a19d88371d06a3ffa828ba61e466a.jpg"];
        
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        UIImage *image1 = [UIImage imageWithData:imageData];
        
        self.image1 = image1;
        
        NSLog(@"image1 %@ thread %@",self.image1,[NSThread currentThread]);
    });
    
    dispatch_group_async(group, queue, ^{
        
        NSURL *url = [NSURL URLWithString:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1524476939073&di=533a0cc017cb68f289f9dc304f508187&imgtype=0&src=http%3A%2F%2Fe.hiphotos.baidu.com%2Fimage%2Fpic%2Fitem%2Fae51f3deb48f8c54c8a5db4236292df5e0fe7f6c.jpg"];
        
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        
        UIImage *image2 = [UIImage imageWithData:imageData];
        
        self.image2 = image2;
        
        NSLog(@"image2 %@ thread %@",self.image2,[NSThread currentThread]);
    });
    
    dispatch_group_notify(group, queue, ^{
        UIGraphicsBeginImageContext(CGSizeMake(200, 200));
        [self.image1 drawInRect:CGRectMake(0, 0, 200, 100)];
        [self.image2 drawInRect:CGRectMake(0, 100, 200, 100)];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        NSLog(@"dispatch_group_notify %@  thread  %@",image,[NSThread currentThread]);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"UI ----- %@",[NSThread currentThread]);
            self.imageView.image = image;
        });
    });
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
