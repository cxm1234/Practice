//
//  ESWine.h
//  13-数据刷新
//
//  Created by zkinc on 2018/4/17.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ESWine : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *money;

@property (assign, nonatomic, getter=isChecked) BOOL checked;

@end
