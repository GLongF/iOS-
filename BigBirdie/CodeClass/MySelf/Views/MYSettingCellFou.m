//
//  MYSettingCellFou.m
//  BigBirdie
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYSettingCellFou.h"

@interface MYSettingCellFou ()

@property (nonatomic, strong)UILabel * myTitleLabel;

@end

@implementation MYSettingCellFou

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpSubViews];
    }
    return self;
}

- (void)setUpSubViews {
    
    _myTitleLabel = [[UILabel alloc] init];
    _myTitleLabel.textColor = [UIColor blackColor];
    _myTitleLabel.font = FONT(16 * kWidth_Scale);
    _myTitleLabel.text = @"退出登录";
    _myTitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:_myTitleLabel];
    [_myTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)setDic:(NSDictionary *)dic {
    
    self.myTitleLabel.text = dic[@"title"];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
