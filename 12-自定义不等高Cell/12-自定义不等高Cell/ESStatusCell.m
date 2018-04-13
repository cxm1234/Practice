//
//  ESStatusCell.m
//  12-自定义不等高Cell
//
//  Created by zkinc on 2018/4/13.
//  Copyright © 2018年 zkinc. All rights reserved.
//

#import "ESStatusCell.h"
#import "ESStatus.h"

#define ESTextFont [UIFont systemFontOfSize:14]
#define ESNameFont [UIFont systemFontOfSize:14]
@interface ESStatusCell()

@property(nonatomic, weak) UIImageView *iconImageView;

@property(nonatomic, weak) UILabel *nameLabel;

@property(nonatomic, weak) UIImageView *vipImageView;

@property(nonatomic, weak) UILabel *text_Label;

@property(nonatomic, weak) UIImageView *pictureImageView;

@end

@implementation ESStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.contentMode = UIViewContentModeCenter;
        vipImageView.image = [UIImage imageNamed:@"vip"];
        self.vipImageView = vipImageView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = ESNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        UILabel *text_label = [[UILabel alloc] init];
        text_label.font = ESTextFont;
        text_label.numberOfLines = 0;
        [self.contentView addSubview:text_label];
        self.text_Label = text_label;
    }
    return self;
}

-(void)setStatus:(ESStatus *)status
{
    _status = status;
    self.iconImageView.image = [UIImage imageNamed:status.icon];
    self.nameLabel.text = status.name;
    
    if(status.isVip){
        self.nameLabel.textColor = [UIColor orangeColor];
        self.vipImageView.hidden = NO;
    }else{
        self.nameLabel.textColor = [UIColor blackColor];
        self.vipImageView.hidden = YES;
    }
    
    self.text_Label.text = status.text;
    
    if(status.picture){
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:status.picture];
    }else{
        self.pictureImageView.hidden = YES;
    }
    
    self.iconImageView.frame = self.status.iconFrame;
    self.nameLabel.frame = self.status.nameFrame;
    self.vipImageView.frame = self.status.vipFrame;
    self.text_Label.frame = self.status.textFrame;
    self.pictureImageView.frame = self.status.pictureFrame;
}

@end
