//
//  FlagItem.m
//  15-拦截用户输入
//
//  Created by zkinc on 2018/4/20.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "FlagItem.h"

@implementation FlagItem

+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    FlagItem *item = [[FlagItem alloc] init];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [item setValue:obj forKey:key];
    }];
    
    return item;
}

- (void)setIcon:(NSString *)icon
{
    _icon = [UIImage imageNamed:icon];
}

@end
