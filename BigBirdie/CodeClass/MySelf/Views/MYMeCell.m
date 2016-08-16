//
//  MYMeCell.m
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeCell.h"

@interface MYMeCell ()
// 间隔线
@property(nonatomic,strong) UILabel *spaceLabel;
@end

@implementation MYMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpView];
    }
    return self;
}


- (void)setUpView{
    __weak typeof (self) weakSelf = self;
    self.img = [[UIImageView alloc] initWithFrame:CGRectMake(20,15, 25, 25)];
    [self.contentView addSubview:self.img];
    [self.img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(102 / 3 * kWidth_Scale));
        make.centerY.equalTo(weakSelf.contentView);
        make.width.height.equalTo(@(51 / 3 *kWidth_Scale));
    }];
    
    self.lable = [[UILabel alloc] init];
    self.lable.textColor = [UIColor whiteColor];
    self.lable.font = [UIFont systemFontOfSize:16 * kWidth_Scale];
    [self.contentView addSubview:self.lable];
    [self.lable mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.left.equalTo(@(64 / 3 * kWidth_Scale));
        make.left.mas_equalTo(weakSelf.img.mas_right).offset(64 / 3 * kWidth_Scale);
        make.top.equalTo(@(54 / 3 * kWidth_Scale));
        make.bottom.mas_equalTo(weakSelf.contentView).offset(- 54 / 3 * kWidth_Scale);
        make.width.equalTo(@(80 * kWidth_Scale));
        
    }];
    
    self.spaceLabel = [[UILabel alloc] init];
    self.spaceLabel.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.spaceLabel];
    [self.spaceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(30 *kWidth_Scale));
        make.right.equalTo(@(SCREEN_WIDTH - 30 * kWidth_Scale));
        make.height.equalTo(@0.6);
        make.bottom.mas_equalTo(weakSelf.contentView);
    }];

    
#warning 关于这个Lable再考虑考虑
    self.introduceLable = [[UILabel alloc] init];
    [self.contentView addSubview:self.introduceLable];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
