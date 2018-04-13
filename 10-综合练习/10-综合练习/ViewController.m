//
//  ViewController.m
//  10-综合练习
//
//  Created by zkinc on 2018/4/3.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ViewController.h"
#import "ShopView.h"
#import "ShopItem.h"
#define kRowNum 2  //行数
#define kColNum 3  //列数
#define kWidth 80
#define kHeight 100
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *shopCarView;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;
@property (weak, nonatomic) IBOutlet UILabel *hudLabel;
@property (strong, nonatomic) NSArray *dataArr;
@end

@implementation ViewController
-(NSArray *)dataArr
{
    if(_dataArr == nil){
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopData.plist" ofType:nil];
        NSArray *dicArr = [NSArray arrayWithContentsOfFile:dataPath];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dic in dicArr) {
            ShopItem *shopItem = [ShopItem shopWithDic:dic];
            [tempArr addObject:shopItem];
        }
        self.dataArr = tempArr;
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)add:(UIButton *)sender {
    CGFloat carWidth = self.shopCarView.bounds.size.width;
    CGFloat carHeight = self.shopCarView.bounds.size.height;
    NSInteger index = self.shopCarView.subviews.count;
    CGFloat vMargin = (carWidth - kColNum * kWidth) / (kColNum - 1);  //水平间距
    CGFloat hMargin = (carHeight - kRowNum * kHeight) / (kRowNum - 1);  //垂直间距
    CGFloat x = (kWidth + vMargin) * (index % kColNum);
    CGFloat y = (kHeight + hMargin) * (index / kColNum);

    ShopView *shopView = [ShopView shopView];
    shopView.frame = CGRectMake(x, y, kWidth, kHeight);
    ShopItem *shopItem = self.dataArr[index];
    [shopView setShop:shopItem];
    [self.shopCarView addSubview:shopView];
    sender.enabled = (index != 5);
    self.removeBtn.enabled = YES;
    
    if(index == 5){
        [self showDetailInfo:@"当前购物车已满,不要买买买~"];
    }
}

- (IBAction)remove:(UIButton *)sender {
    UIView *lastShopView = [self.shopCarView.subviews lastObject];
    [lastShopView removeFromSuperview];
    self.addBtn.enabled = YES;
    sender.enabled = (self.shopCarView.subviews.count != 0);
    if(self.shopCarView.subviews.count == 0){
        [self showDetailInfo:@"当前购物车已空,赶紧买买买~"];
    }
}

- (void)showDetailInfo:(NSString *)info
{
    [UIView animateWithDuration:2.0 animations:^{
        self.hudLabel.text = info;
        self.hudLabel.alpha = 1.f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 delay:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
            self.hudLabel.alpha = 0;
        } completion:nil];
    }];
}

@end
