//
//  ESStatus.m
//  12-自定义不等高Cell
//
//  Created by zkinc on 2018/4/13.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ESStatus.h"

@implementation ESStatus

-(CGFloat)cellHeight
{
    if(_cellHeight == 0){
        
        CGFloat space = 10;
        
        CGFloat iconX = space;
        CGFloat iconY = space;
        CGFloat iconWH = 30;
        self.iconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
        
        CGFloat nameX = CGRectGetMaxX(self.iconFrame) + space;
        CGFloat nameY = iconY;
        NSDictionary *nameAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:17]};
        CGSize nameSize = [self.name sizeWithAttributes:nameAtt];
        CGFloat nameW = nameSize.width;
        CGFloat nameH = nameSize.height;
        self.nameFrame = CGRectMake(nameX, nameY, nameW, nameH);
        
        if(self.isVip){
            CGFloat vipX = CGRectGetMaxX(self.nameFrame) + space;
            CGFloat vipY = nameY;
            CGFloat vipW = [UIScreen mainScreen].bounds.size.width - 2 * space;
            CGFloat vipH = nameH;
            self.vipFrame = CGRectMake(vipX, vipY, vipW, vipH);
        }
        
        CGFloat textX = iconX;
        CGFloat textY = CGRectGetMaxY(self.iconFrame) + space;
        CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * space;
        NSDictionary *textAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
        CGSize textSize = CGSizeMake(textW, MAXFLOAT);
        CGFloat textH = [self.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
        self.textFrame = CGRectMake(textX, textY, textW, textH);
        
        if(self.picture){
            CGFloat pictureWH = 100;
            CGFloat pictureX = iconX;
            CGFloat pictureY = CGRectGetMaxY(self.textFrame) + space;
            self.pictureFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
            _cellHeight = CGRectGetMaxY(self.pictureFrame) + space;
        }else{
            _cellHeight = CGRectGetMaxY(self.textFrame) + space;
        }
    }
    return _cellHeight;
}

@end
