//
//  ShopView.m
//  10-综合练习
//
//  Created by zkinc on 2018/4/3.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ShopView.h"
#import "ShopItem.h"
@interface ShopView()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ShopView

+ (instancetype)shopView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

-(void)setShop:(ShopItem *)shop
{
    self.imageView.image = [UIImage imageNamed:shop.icon];
    self.titleLabel.text = shop.name;
}

@end
