//
//  MYSettingCellSec.m
//  BigBirdie
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYSettingCellSec.h"

@interface MYSettingCellSec ()

@property (nonatomic, strong) UILabel * myTitleLabel;
@property (nonatomic, strong) UIButton * myBtn;

@end

@implementation MYSettingCellSec


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
    [self.contentView addSubview:_myTitleLabel];
    [_myTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 20, 0, 100));
    }];
    
    _myBtn = [[UIButton alloc] init];
    _myBtn.backgroundColor = [UIColor blueColor];
    [self.contentView addSubview:_myBtn];
    [_myBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self).offset(-20);
        make.centerY.equalTo(self);
        make.width.height.equalTo(@30);
    }];
}

- (void)setDic:(NSDictionary *)dic {
    
    self.myTitleLabel.text = dic[@"title"];
    self.myBtn.selected = [dic[@"num"] boolValue];
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
