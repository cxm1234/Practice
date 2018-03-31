//
//  ViewController.m
//  09-杰伦音乐播放器
//
//  Created by zkinc on 2018/3/30.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (nonatomic,strong) AVPlayer *player;
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
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    self.player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
}

- (IBAction)playOrPause:(UIButton *)sender {
    switch (sender.tag) {
        case 3:
            [self.player play];
            break;
        case 4:
            [self.player pause];
            break;
        default:
            break;
    }
    
}


- (IBAction)changeMusic:(UIButton *)sender {
     NSString *musicName = nil;
    switch (sender.tag) {
        case 1:
            musicName = @"mySong2.mp3";
            break;
        case 2:
            musicName = @"mySong3.mp3";
            break;
        default:
            break;
    }
    NSURL *url = [[NSBundle mainBundle] URLForResource:musicName withExtension:nil];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:playerItem];
    [self.player play];
}



@end
