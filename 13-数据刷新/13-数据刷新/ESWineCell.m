//
//  ESWineCell.m
//  13-数据刷新
//
//  Created by zkinc on 2018/4/17.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ESWineCell.h"
#import "ESWine.h"
@interface ESWineCell()

@property(nonatomic,weak) UIImageView *checkedImageView;
@end

@implementation ESWineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        UIImageView *checkedImageView = [[UIImageView alloc] init];
        checkedImageView.hidden = YES;
        checkedImageView.image = [UIImage imageNamed:@"check"];
        [self.contentView addSubview:checkedImageView];
        self.checkedImageView = checkedImageView;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat WH = 24;
    CGFloat X = self.contentView.frame.size.width - WH - 10;
    CGFloat Y = (self.contentView.frame.size.height - WH) * 0.5;
    self.checkedImageView.frame = CGRectMake(X, Y, WH, WH);
    
    CGRect frame = self.textLabel.frame;
    frame.size.width = self.contentView.frame.size.width - WH - 20 - self.textLabel.frame.origin.x;
    self.textLabel.frame = frame;
}

-(void)setWine:(ESWine *)wine
{
    _wine = wine;
    self.textLabel.text = wine.name;
    self.imageView.image = [UIImage imageNamed:wine.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@",wine.money];
    if(wine.isChecked){
        self.checkedImageView.hidden = NO;
    }else{
        self.checkedImageView.hidden = YES;
    }
}



@end
