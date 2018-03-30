//
//  ViewController.m
//  09-杰伦音乐播放器
//
//  Created by zkinc on 2018/3/30.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIToolbar *toolbar = [[UIToolbar alloc] init];
    toolbar.frame = self.bgImageView.bounds;
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.98;
    [self.bgImageView addSubview:toolbar];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"mySong1.mp3" withExtension:nil];
    
}

- (IBAction)playOrPause:(UIButton *)sender {
}


- (IBAction)changeMusic:(UIButton *)sender {
}



@end
