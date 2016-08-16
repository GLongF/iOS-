//
//  MYSettingCellThi.m
//  BigBirdie
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYSettingCellThi.h"



@interface MYSettingCellThi ()

@property (nonatomic, strong) UILabel * myTitleLabel;
@property (nonatomic, strong) UILabel * myDetailLabel;

@end

@implementation MYSettingCellThi


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
    _myTitleLabel.text = @"清理缓存";
    [self.contentView addSubview:_myTitleLabel];
    [_myTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 20, 0, 100));
    }];
    
    _myDetailLabel = [[UILabel alloc] init];
    _myDetailLabel.font = FONT(16 * kWidth_Scale);
    _myDetailLabel.textAlignment = NSTextAlignmentRight;
    _myDetailLabel.textColor = [UIColor blueColor];
    _myDetailLabel.text = @"0 KB";
    [self.contentView addSubview:_myDetailLabel];
    [_myDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.right.equalTo(self).offset(-20);
        make.bottom.top.equalTo(self);
        make.left.equalTo(_myTitleLabel.mas_right);
    }];
}

- (void)setDic:(NSDictionary *)dic {
    
    self.myTitleLabel.text = dic[@"title"];
    
    NSNumber * num = dic[@"num"];
    CGFloat size = [num doubleValue];
    if (size > 1000) {
        
        self.myDetailLabel.text = @"1 Mb";
    }else {
        
        self.myDetailLabel.text = @"1 Kb";
    }
    
}

- (void)refreshCellWithMemSize:(CGFloat)size {
    
    
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
