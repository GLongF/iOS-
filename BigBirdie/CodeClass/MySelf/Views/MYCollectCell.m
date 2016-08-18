//
//  MYCollectCell.m
//  BigBirdie
//
//  Created by mac on 16/8/17.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYCollectCell.h"

@interface MYCollectCell ()

@property (nonatomic, strong) UIImageView * CDImageView;
@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UILabel * timeLengthLabel;
@property (nonatomic, strong) UILabel * onLineTimeLabel;

@end

@implementation MYCollectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    
    _CDImageView = [[UIImageView alloc] init];
    _CDImageView.layer.cornerRadius = 30 * kWidth_Scale;
    _CDImageView.image = [UIImage imageNamed:@"photo@3x.png"];
    [self.contentView addSubview:_CDImageView];
    
    [_CDImageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(_CDImageView.superview);
        make.width.height.equalTo(@(60 * kWidth_Scale));
        make.left.equalTo(_CDImageView.superview).offset(10);
    }];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.text = @"我是贱，你来咬我啊";
    _titleLabel.font = FONT(16 * kWidth_Scale);
//    _titleLabel.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.top.equalTo(_titleLabel.superview);
        make.left.equalTo(_CDImageView.mas_right).offset(10);
        make.width.equalTo(@(150 * kWidth_Scale));
    }];
    
    _onLineTimeLabel = [[UILabel alloc] init];
    _onLineTimeLabel.text = @"2016-08-17";
    _onLineTimeLabel.font = FONT(14 * kWidth_Scale);
//    _onLineTimeLabel.backgroundColor = [UIColor orangeColor];
    _onLineTimeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_onLineTimeLabel];
    [_onLineTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.top.equalTo(_onLineTimeLabel.superview);
        make.right.equalTo(_onLineTimeLabel.superview).offset(-10);
        make.width.equalTo(@(90 * kWidth_Scale));
    }];
    
    _timeLengthLabel = [[UILabel alloc] init];
    _timeLengthLabel.text = @"00:59";
    _timeLengthLabel.font = FONT(14 * kWidth_Scale);
//    _timeLengthLabel.backgroundColor = [UIColor orangeColor];
    _timeLengthLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_timeLengthLabel];
    [_timeLengthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.bottom.top.equalTo(_timeLengthLabel.superview);
        make.right.equalTo(_onLineTimeLabel.mas_left).offset(-10);
        make.width.equalTo(@(50 * kWidth_Scale));
    }];
}

@end
