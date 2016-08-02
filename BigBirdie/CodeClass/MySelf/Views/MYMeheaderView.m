//
//  MYMeheaderView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeheaderView.h"

#define PHOTOIMAGE_WIDTH 100
#define LABLE_WIDTH 80
#define LABLE_FONT 13.f

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


#warning  均为做自适应布局

- (void)setupView {
     __weak typeof (self) weakSelf = self;
    // 背景
    self.backImage = [[UIImageView alloc] initWithFrame:self.frame];
    self.backImage.image = [UIImage imageNamed:@"5.png"];
    [self addSubview:self.backImage];
    
    
    // 头像
    self.photoImage = [[UIImageView alloc] init];
    [self.photoImage setImage:[UIImage imageNamed:@"photo.png"]];
//    self.photoImage.layer.cornerRadius = 50;
//    self.photoImage.layer.masksToBounds = YES;
//    self.photoImage.layer.borderWidth = 5;
    self.photoImage.layer.borderColor = [UIColor whiteColor].CGColor;

    [self addSubview:self.photoImage];
    [self.photoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(weakSelf.backImage).mas_offset((465 / 3 )* 2);
        make.right.mas_equalTo(weakSelf.backImage).mas_offset((-465 / 3) * 2);
    }];
    
    // 性别
    self.genderImage = [[UIImageView alloc] init];
    [self.backImage addSubview:self.genderImage];
    
    
    // 名字
    self.nameLable = [[UILabel alloc] init];
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    self.nameLable.text = @"懵逼的少女";
    [self.backImage addSubview:self.nameLable];
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.photoImage.mas_bottom);
        make.left.mas_equalTo(weakSelf.photoImage);
        make.size.mas_equalTo(CGSizeMake(100, 44));
    }];
    
    
    // 关注
    self.focusLableA = [[UILabel alloc] init];
    self.focusLableA.text = @"关注";
    [self.focusLableA setFont:[UIFont systemFontOfSize:LABLE_FONT]];
    self.focusLableA.textAlignment = NSTextAlignmentCenter;
    [self.backImage addSubview:self.focusLableA];
    [self.focusLableA mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.nameLable.mas_bottom);
        
    }];
    
//    self.focusLableB = [[UILabel alloc] initWithFrame:CGRectMake(60, self.nameLable.bottom + 20,LABLE_WIDTH, 30)];
//    [self.focusLableB setFont:[UIFont systemFontOfSize:LABLE_FONT]];
//    self.focusLableB.textAlignment = NSTextAlignmentCenter;
//    self.focusLableB.text = @"10万";
//    [self.backImage addSubview:self.focusLableB];
//    
//    
//    // 粉丝
//    self.funsLableA = [[UILabel alloc] initWithFrame:CGRectMake(160, self.nameLable.bottom ,LABLE_WIDTH, 30)];
//    self.funsLableA.text = @"粉丝";
//    [self.funsLableA setFont:[UIFont systemFontOfSize:LABLE_FONT]];
//    self.funsLableA.textAlignment = NSTextAlignmentCenter;
//    [self.backImage addSubview:self.funsLableA];
//    
//    
//    self.funsLableB = [[UILabel alloc] initWithFrame:CGRectMake(160, self.nameLable.bottom + 20,LABLE_WIDTH, 30)];
//    self.funsLableB.text = @"100万";
//    [self.funsLableB setFont:[UIFont systemFontOfSize:LABLE_FONT]];
//    self.funsLableB.textAlignment = NSTextAlignmentCenter;
//    [self.backImage addSubview:self.funsLableB];

#warning 名字还没想好
    
    // 点赞
//    self.praiseLableA = [[UILabel alloc] initWithFrame:CGRectMake(260, self.nameLable.bottom ,LABLE_WIDTH, 30)];
//    self.praiseLableA.text = @"大嘴币";
//    [self.praiseLableA setFont:[UIFont systemFontOfSize:LABLE_FONT]];
//    self.praiseLableA.textAlignment = NSTextAlignmentCenter;
//    [self.backImage addSubview:self.praiseLableA];
//    
//    self.praiseLableB = [[UILabel alloc] initWithFrame:CGRectMake(260, self.nameLable.bottom + 20,LABLE_WIDTH, 30)];
//    self.praiseLableB.text = @"1231";
//    [self.praiseLableB setFont:[UIFont systemFontOfSize:LABLE_FONT]];
//    self.praiseLableB.textAlignment = NSTextAlignmentCenter;
//    [self.backImage addSubview:self.praiseLableB];
//    
//    
//    // 间隔线
//    self.lable1 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bottom - 3, self.width, 3)];
//    self.lable1.backgroundColor = [UIColor grayColor];
//    self.lable1.alpha = 0.5;
//    [self.backImage addSubview:self.lable1];
//    
//    
//    self.lable2 = [[UILabel alloc] initWithFrame:CGRectMake((self.focusLableA.right + self.funsLableA.left) / 2, self.nameLable.bottom + 10, 2, 30)];
//    self.lable2.backgroundColor = [UIColor blackColor];
//    [self.backImage addSubview:self.lable2];
//    
//    self.lable3 = [[UILabel alloc] initWithFrame:CGRectMake((self.funsLableA.right + self.praiseLableA.left) / 2, self.nameLable.bottom + 10, 2, 30)];
//    self.lable3.backgroundColor = [UIColor blackColor];
//    [self.backImage addSubview:self.lable3];
//
}

@end
