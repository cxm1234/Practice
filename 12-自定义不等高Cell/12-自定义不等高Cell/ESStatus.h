//
//  ESStatus.h
//  12-自定义不等高Cell
//
//  Created by zkinc on 2018/4/13.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ESStatus : NSObject

@property(nonatomic, copy) NSString *icon;

@property(nonatomic, copy) NSString *name;

@property(nonatomic, copy) NSString *text;

@property (assign, nonatomic,getter=isVip) BOOL vip;

@property(nonatomic, copy) NSString *picture;


/**frame数据**/
@property (assign, nonatomic) CGRect iconFrame;

@property (assign, nonatomic) CGRect nameFrame;

@property (assign, nonatomic) CGRect vipFrame;

@property (assign, nonatomic) CGRect textFrame;

@property (assign, nonatomic) CGRect pictureFrame;

@property (assign, nonatomic) CGFloat cellHeight;

@end
