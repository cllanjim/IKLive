//
//  IKLiveCell.m
//  IKLive
//
//  Created by 吕成翘 on 16/11/5.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "IKLiveCell.h"
#import "IKLiveModel.h"


@interface IKLiveCell ()

@property (strong, nonatomic) UIImageView *iconImageView;
@property (strong, nonatomic) UILabel *nameLable;
@property (strong, nonatomic) UILabel *onlineCountLabel;
@property (strong, nonatomic) UIImageView *liveImageView;
@property (strong, nonatomic) UILabel *addressLable;

@end


@implementation IKLiveCell

- (void)setModel:(IKLiveModel *)model {
    _model = model;
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",model.portrait]];
    NSString *address = [model.city isEqual: @""] ? @"难道在火星?" : model.city;
    
    [_iconImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"rectangleDefaultAvatar"]];
    _nameLable.text = model.nick;
    _addressLable.text = address;
    _onlineCountLabel.text = @(model.online_users).description;
    [_liveImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"rectangleDefaultAvatar"]];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 45, 45)];
    iconImageView.image = [UIImage imageNamed:@"rectangleDefaultAvatar"];
    iconImageView.layer.cornerRadius = iconImageView.bounds.size.width * 0.5;
    iconImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:iconImageView];
    _iconImageView = iconImageView;
    
    UILabel *nameLable = [UILabel new];
    nameLable.text = @"名字";
    nameLable.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:nameLable];
    _nameLable = nameLable;
    
    
    UILabel *addressLable = [UILabel new];
    addressLable.text = @"地址";
    addressLable.font = [UIFont systemFontOfSize:14];
    addressLable.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:addressLable];
    _addressLable = addressLable;
    
    UIButton *addressButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addressButton setImage:[UIImage imageNamed:@"global_arrow_gps"] forState:UIControlStateNormal];
    [self.contentView addSubview:addressButton];
    
    UILabel *onlineCountLabel = [UILabel new];
    onlineCountLabel.text = @"2333";
    onlineCountLabel.font = [UIFont systemFontOfSize:17];
    onlineCountLabel.textColor = [UIColor orangeColor];
    [self.contentView addSubview:onlineCountLabel];
    _onlineCountLabel = onlineCountLabel;
    
    UILabel *watchLabel = [UILabel new];
    watchLabel.text = @"在看";
    watchLabel.font = [UIFont systemFontOfSize:14];
    watchLabel.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:watchLabel];
    
    UIImageView *liveImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rectangleDefaultAvatar"]];
    [self.contentView addSubview:liveImageView];
    _liveImageView = liveImageView;
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [UIColor colorWithRed:241 green:248 blue:248];
    [self.contentView addSubview:lineView];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.size.mas_equalTo(CGSizeMake(45, 45));
    }];
    
    [nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageView).offset(3);
        make.left.equalTo(iconImageView.mas_right).offset(10);
    }];
    
    [addressLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(iconImageView).offset(-3);
        make.left.equalTo(nameLable);
    }];
    
    [addressButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(addressLable);
        make.left.equalTo(addressLable.mas_right).offset(8);
    }];
    
    [onlineCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(nameLable);
    }];
    
    [watchLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(onlineCountLabel);
        make.top.equalTo(addressButton);
    }];
    
    [liveImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageView.mas_bottom).offset(10);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(self.contentView.bounds.size.width / 45 * 46);
    }];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(liveImageView.mas_bottom);
        make.height.mas_equalTo(10);
        make.left.right.bottom.equalTo(self.contentView);
    }];
}

@end
