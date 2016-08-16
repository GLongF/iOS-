//
//  MYMeheaderView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeheaderView.h"


#define LABLEA_FONT 15.f
#define LABLEB_FONT 13.f

@interface MYMeheaderView ()
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
    self.photoImage = [[UIButton alloc] init];
    [self.photoImage setImage:[UIImage imageNamed:@"photo.png"] forState:UIControlStateNormal];
    self.photoImage.layer.cornerRadius = 50 * kWidth_Scale;
    self.photoImage.layer.masksToBounds = YES;
    self.photoImage.layer.borderWidth = 3 * kWidth_Scale;
    self.photoImage.layer.borderColor = [UIColor whiteColor].CGColor;
    [self addSubview:self.photoImage];
    [self.photoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.backImage).mas_offset(65 / 3 * kWidth_Scale);
        make.width.height.equalTo(@(100 * kWidth_Scale));
        make.centerX.equalTo(weakSelf.backImage);
    }];
    //给头像添加点击手势
    self.photoImage.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] init];
    [self.photoImage addGestureRecognizer:tap];
    
    @weakify(self);
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        @strongify(self);
        [self.subject sendNext:x];
    }];
    
    // 性别
    self.genderImage = [[UIImageView alloc] init];
    [self.genderImage setImage:[UIImage imageNamed:@""]];
    self.genderImage.backgroundColor = [UIColor redColor];
    [self.backImage addSubview:self.genderImage];
    [self.genderImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(weakSelf.backImage).top.offset(306 / 3 * kWidth_Scale);
        make.top.mas_equalTo(weakSelf.backImage).offset(100 * kWidth_Scale);
        make.right.mas_equalTo(weakSelf.backImage).offset(- 440 / 3 * kWidth_Scale);
        make.width.equalTo(@(18 * kWidth_Scale));
        make.height.equalTo(@(24 * kWidth_Scale));
    }];
    // 等级
    self.level = [[UILabel alloc] init];
    [self.backImage addSubview:self.level];
    
    // 名字
    self.nameLable = [[UILabel alloc] init];
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    self.nameLable.text = @"懵逼的少女";
    self.nameLable.textColor = [UIColor whiteColor];
    self.nameLable.font = [UIFont systemFontOfSize:15 * kWidth_Scale];
    [self.backImage addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.photoImage.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.photoImage);
        make.width.equalTo(@(150 * kWidth_Scale));
        make.height.equalTo(@(20 * kWidth_Scale));
    }];
    
    
    /******  粉丝  ******/
    self.funsButton = [[UIButton alloc] init];
    [self addButton:self.funsButton Title:@"粉丝" font:LABLEA_FONT * kWidth_Scale colorString:@"#000000"];
    [self.backImage addSubview:self.funsButton];
    [self.funsButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameLable.mas_bottom).offset(20 * kWidth_Scale);
        make.height.equalTo(@(14 * kWidth_Scale));
        make.centerX.equalTo(weakSelf.photoImage);
        make.width.equalTo(@(30 * kWidth_Scale));
    }];
    

    self.funsLableB = [[UILabel alloc] init];
    self.funsLableB.text = @"100万";
    [self.funsLableB setFont:[UIFont systemFontOfSize:LABLEB_FONT * kWidth_Scale]];
    self.funsLableB.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.funsLableB];
    [self.funsLableB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsButton.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.funsButton);
        make.height.equalTo(@(14 * kWidth_Scale));
    }];
    
    
    /******  关注  ******/
    self.focusButton = [[UIButton alloc] init];
    [self addButton:self.focusButton Title:@"关注" font:LABLEA_FONT * kWidth_Scale colorString:@"#000000"];
    [self.backImage addSubview:self.focusButton];
    [self.focusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameLable.mas_bottom).offset(20 * kWidth_Scale);
        make.height.equalTo(@(14 * kWidth_Scale));
        make.right.mas_equalTo(weakSelf.funsButton.mas_left).offset( - 60 * kWidth_Scale);
        make.width.equalTo(@(30 * kWidth_Scale));
    }];
    
    
    self.focusLableB = [[UILabel alloc] init];
    [self.focusLableB setFont:[UIFont systemFontOfSize:LABLEB_FONT * kWidth_Scale]];
    self.focusLableB.textAlignment = NSTextAlignmentCenter;
    self.focusLableB.text = @"10万";
    [self.backImage addSubview:self.focusLableB];
    [self.focusLableB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsButton.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.focusButton);
        make.height.equalTo(@(14 * kWidth_Scale));
    }];

    

    
    /******  大嘴币  ******/
    self.coinButton = [[UIButton alloc] init];
    [self addButton:self.coinButton Title:@"试币" font:LABLEA_FONT * kWidth_Scale colorString:@"#000000"];
    [self.backImage addSubview:self.coinButton];
    [self.coinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameLable.mas_bottom).offset(20 * kWidth_Scale);
        make.height.equalTo(@(14 * kWidth_Scale));
        make.left.mas_equalTo(weakSelf.funsButton.mas_right).offset(60 * kWidth_Scale);
        make.width.equalTo(@(30 * kWidth_Scale));
    }];

    
    self.praiseLableB = [[UILabel alloc] init];
    self.praiseLableB.text = @"1231";
    [self.praiseLableB setFont:[UIFont systemFontOfSize:LABLEB_FONT * kWidth_Scale]];
    self.praiseLableB.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.praiseLableB];
    [self.praiseLableB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsButton.mas_bottom).offset(10 * kWidth_Scale);
        make.centerX.equalTo(weakSelf.coinButton);
        make.height.equalTo(@(14* kWidth_Scale));
    }];

    
    /******  间隔线  ******/
    self.lable1 = [[UILabel alloc] init];
    self.lable1.backgroundColor = [UIColor grayColor];
    self.lable1.alpha = 0.6;
    [self.backImage addSubview:self.lable1];
    [self.lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsButton.mas_top).offset(5 * kWidth_Scale);
        make.left.equalTo(@(470 / 3 * kWidth_Scale));
        make.width.equalTo(@(2 * kWidth_Scale));
        make.height.equalTo(@(30 * kWidth_Scale));
    }];
    

    self.lable2 = [[UILabel alloc] init];
    self.lable2.backgroundColor = [UIColor grayColor];
    self.lable2.alpha = 0.6;
    [self.backImage addSubview:self.lable2];
    [self.lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.funsButton.mas_top).offset(5 * kWidth_Scale);
        make.right.mas_equalTo(weakSelf.backImage.right).offset(- 470 / 3 * kWidth_Scale);
        make.width.equalTo(@(2 * kWidth_Scale));
        make.height.equalTo(@(30 * kWidth_Scale));
    }];
    
}

- (void)addButton:(UIButton *)button Title:(NSString *)title font:(CGFloat)font  colorString:(NSString *)colorStr {
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button setTitleColor:[UIColor colorWithHexString:colorStr] forState:UIControlStateNormal];
}


#pragma mark -getter
- (RACSubject *)subject {
    
    if (!_subject) {
        
        _subject = [[RACSubject alloc] init];
    }
    return _subject;
}


@end
