//
//  ViewController.m
//  08-拳皇
//
//  Created by xiaoming on 2018/3/29.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic,strong) NSArray *sandImages;
@property (nonatomic,strong) NSArray *bigImages;
@property (nonatomic,strong) NSArray *smallImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.sandImages = [self loadImagesWithImagePrefix:@"stand" count:10];
    self.bigImages = [self loadImagesWithImagePrefix:@"dazhao" count:87];
    self.smallImages = [self loadImagesWithImagePrefix:@"xiaozhao1" count:21];
    [self stand];
}

- (NSArray *)loadImagesWithImagePrefix:(NSString *)prefix count:(NSInteger)count
{
    NSMutableArray<UIImage *> *images = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < count ; i ++) {
        NSString *imageName = [NSString stringWithFormat:@"%@_%ld",prefix,i+1];
        NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
        [images addObject:image];
    }
    return images;
}
- (IBAction)jieshu{
    self.bigImages = nil;
    self.smallImages = nil;
    self.sandImages = nil;
    self.imageView.animationImages = nil;
}
- (IBAction)xiaozhao{
    [self playZhaoWithImages:self.smallImages count:1 duration:1.5 isStand:NO];
}

- (IBAction)dazhao{
    [self playZhaoWithImages:self.bigImages count:1 duration:2.5 isStand:NO];
}

- (IBAction)stand{
    [self playZhaoWithImages:self.sandImages count:0 duration:0.6 isStand:YES];
    
}

- (void)playZhaoWithImages:(NSArray *)images count:(NSInteger)count duration:(NSTimeInterval)duration isStand:(BOOL)isStand{
    self.imageView.animationImages = images;
    self.imageView.animationDuration = duration;
    self.imageView.animationRepeatCount = count;
    
    [self.imageView startAnimating];
    
    if(!isStand){
        [self performSelector:@selector(stand) withObject:nil afterDelay:self.imageView.animationDuration];
    }
}


@end
