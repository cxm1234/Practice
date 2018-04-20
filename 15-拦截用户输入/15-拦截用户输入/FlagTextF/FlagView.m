//
//  FlagView.m
//  15-拦截用户输入
//
//  Created by zkinc on 2018/4/20.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "FlagView.h"
#import "FlagItem.h"

@interface FlagView()

@property (weak, nonatomic) IBOutlet UILabel *nameL;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageL;


@end

@implementation FlagView

+ (instancetype)flagView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

-(void)setItem:(FlagItem *)item
{
    _item = item;
    self.nameL.text = item.name;
    self.iconImageL.image = item.icon;
}
@end
