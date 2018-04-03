//
//  ShopItem.m
//  10-综合练习
//
//  Created by zkinc on 2018/4/3.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ShopItem.h"

@implementation ShopItem

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if(self = [super init]){
        self.icon = dic[@"icon"];
        self.name = dic[@"name"];
    }
    return self;
}

+(instancetype)shopWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}

@end
