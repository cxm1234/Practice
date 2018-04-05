//
//  CCPageView.m
//  11-分页控件
//
//  Created by xiaoming on 2018/4/5.
//  Copyright © 2018年 xiaoming. All rights reserved.
//

#import "CCPageView.h"

@interface CCPageView()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic,strong) NSTimer *timer;

@end

@implementation CCPageView

+ (instancetype)pageView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

-(void)awakeFromNib
{
   self.pageControl.hidesForSinglePage = YES;
    
    [self startTimer];
}

- (void)startTimer
{
    self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(nextPage:) userInfo:@"123" repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer
{
    [self.timer invalidate];
}

- (void)nextPage:(NSTimer *)timer
{
    NSInteger page = self.pageControl.currentPage + 1;
    
    if(page == self.imageNames.count){
        page = 0;
    }
    [self.scrollView setContentOffset:CGPointMake(page * self.scrollView.frame.size.width, 0) animated:YES];
}

- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    NSInteger count = imageNames.count;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:imageNames[i]];
        imageView.frame = CGRectMake(scrollViewW * i, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(scrollViewW * count, scrollViewH);
    self.pageControl.numberOfPages = count;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self startTimer];
}


@end
