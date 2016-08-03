//
//  MYMeheaderView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeheaderView.h"


#define LABLEA_FONT 16.f
#define LABLEB_FONT 13.f

@interface MYMeheaderView ()
// 关注
@property(nonatomic,strong) UILabel *focusLableA;
// 粉丝
@property(nonatomic,strong) UILabel *funsLableA;
// 点赞
@property(nonatomic,strong) UILabel *praiseLableA;
// 间隔线
@property(nonatomic,strong) UILabel *lable1;
@property(nonatomic,strong) UILabel *lable2;
@end

@implementation MYMeheaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
    }
    return self;
}



- (void)setupView {
     __weak typeof (self) weakSelf = self;
    // 背景
    self.backImage = [[UIImageView alloc] initWithFrame:self.frame];
    self.backImage.image = [UIImage imageNamed:@"5.png"];
    [self addSubview:self.backImage];
    
    
    // 头像
    self.photoImage = [[UIImageView alloc] init];
    [self.photoImage setImage:[UIImage imageNamed:@"photo.png"]];
    self.photoImage.layer.cornerRadius = 50 * kWidth_Scale;
    self.photoImage.layer.masksToBounds = YES;
    self.photoImage.layer.borderWidth = 3 * kWidth_Scale;
    self.photoImage.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:self.photoImage];
    [self.photoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.backImage).mas_offset(148 / 3 * kWidth_Scale);
        make.width.height.equalTo(@(100 * kWidth_Scale));
        make.centerX.equalTo(weakSelf.backImage);
    }];
    
    
    // 性别
    self.genderImage = [[UIImageView alloc] init];
    [self.genderImage setImage:[UIImage imageNamed:@""]];
    [self.backImage addSubview:self.genderImage];
    [self.genderImage mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
    // 等级
    self.level = [[UILabel alloc] init];
    [self.backImage addSubview:self.level];
    
    // 名字
    self.nameLable = [[UILabel alloc] init];
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    self.nameLable.text = @"懵逼的少女";
    self.nameLable.textColor = [UIColor whiteColor];
    self.nameLable.font = [UIFont systemFontOfSize:16 * kWidth_Scale];
    [self.backImage addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.photoImage.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.photoImage);
        make.width.equalTo(@(150 * kWidth_Scale));
        make.height.equalTo(@(20 * kWidth_Scale));
    }];
    
    
    /******  粉丝  ******/
    self.funsLableA = [[UILabel alloc] init];
    self.funsLableA.text = @"粉丝";
    [self.funsLableA setFont:[UIFont systemFontOfSize:LABLEA_FONT * kWidth_Scale]];
    self.funsLableA.textAlignment = NSTextAlignmentCenter;
    //self.funsLableA.backgroundColor = [UIColor redColor];
    [self.backImage addSubview:self.funsLableA];
    [self.funsLableA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameLable.mas_bottom).offset(20 * kWidth_Scale);
        make.height.equalTo(@(42 / 3 * kWidth_Scale));
        make.centerX.equalTo(weakSelf.photoImage);
    }];
    

    self.funsLableB = [[UILabel alloc] init];
    self.funsLableB.text = @"100万";
    [self.funsLableB setFont:[UIFont systemFontOfSize:LABLEB_FONT * kWidth_Scale]];
    self.funsLableB.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.funsLableB];
    [self.funsLableB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsLableA.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.funsLableA);
        make.height.equalTo(@(42 / 3 * kWidth_Scale));
    }];
    
    
    /******  关注  ******/
    self.focusLableA = [[UILabel alloc] init];
    self.focusLableA.text = @"关注";
    [self.focusLableA setFont:[UIFont systemFontOfSize: LABLEA_FONT * kWidth_Scale]];
    self.focusLableA.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.focusLableA];
    [self.focusLableA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameLable.mas_bottom).offset(20 * kWidth_Scale);
        make.height.equalTo(@(42 / 3 * kWidth_Scale));
        make.right.mas_equalTo(weakSelf.funsLableA.mas_left).offset( - 60 * kWidth_Scale);
    }];
    
    self.focusLableB = [[UILabel alloc] init];
    [self.focusLableB setFont:[UIFont systemFontOfSize:LABLEB_FONT * kWidth_Scale]];
    self.focusLableB.textAlignment = NSTextAlignmentCenter;
    self.focusLableB.text = @"10万";
    [self.backImage addSubview:self.focusLableB];
    [self.focusLableB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsLableA.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.focusLableA);
        make.height.equalTo(@(42 / 3 * kWidth_Scale));
    }];

    
#warning 名字还没想好
    
    /******  大嘴币  ******/
    self.praiseLableA = [[UILabel alloc] init];
    self.praiseLableA.text = @"大嘴币";
    [self.praiseLableA setFont:[UIFont systemFontOfSize:LABLEA_FONT * kWidth_Scale]];
    self.praiseLableA.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.praiseLableA];
    [self.praiseLableA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameLable.mas_bottom).offset(20 * kWidth_Scale);
        make.height.equalTo(@(42 / 3 * kWidth_Scale));
        make.left.mas_equalTo(weakSelf.funsLableA.mas_right).offset(60 * kWidth_Scale);
    }];

    
    self.praiseLableB = [[UILabel alloc] init];
    self.praiseLableB.text = @"1231";
    [self.praiseLableB setFont:[UIFont systemFontOfSize:LABLEB_FONT * kWidth_Scale]];
    self.praiseLableB.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.praiseLableB];
    [self.praiseLableB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsLableA.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.praiseLableA);
        make.height.equalTo(@(42 / 3 * kWidth_Scale));
    }];

    
    /******  间隔线  ******/
    self.lable1 = [[UILabel alloc] init];
    self.lable1.backgroundColor = [UIColor grayColor];
    self.lable1.alpha = 0.6;
    [self.backImage addSubview:self.lable1];
    [self.lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsLableA.mas_top).offset(5 * kWidth_Scale);
        make.left.equalTo(@(470 / 3 * kWidth_Scale));
        make.width.equalTo(@(2 * kWidth_Scale));
        make.height.equalTo(@(30 * kWidth_Scale));
    }];
    

    self.lable2 = [[UILabel alloc] init];
    self.lable2.backgroundColor = [UIColor grayColor];
    self.lable2.alpha = 0.6;
    [self.backImage addSubview:self.lable2];
    [self.lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsLableA.mas_top).offset(5 * kWidth_Scale);
        make.right.mas_equalTo(weakSelf.backImage.right).offset(- 470 / 3 * kWidth_Scale);
        make.width.equalTo(@(2 * kWidth_Scale));
        make.height.equalTo(@(30 * kWidth_Scale));
    }];
    
}

@end
