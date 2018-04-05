//
//  ShopItem.h
//  10-综合练习
//
//  Created by zkinc on 2018/4/3.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShopItem : NSObject
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;


+ (instancetype)shopWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;
@end
