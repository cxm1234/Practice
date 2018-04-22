//
//  FlagItem.h
//  15-拦截用户输入
//
//  Created by zkinc on 2018/4/20.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FlagItem : NSObject

@property (nonatomic, copy) NSString *name;

@property(nonatomic, strong) UIImage *icon;

+ (instancetype)itemWithDict:(NSDictionary *)dict;

@end
