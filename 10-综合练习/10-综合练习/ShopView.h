//
//  ShopView.h
//  10-综合练习
//
//  Created by zkinc on 2018/4/3.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ShopItem;
@interface ShopView : UIView

+ (instancetype)shopView;

- (void)setShop:(ShopItem *)shop;

@end
