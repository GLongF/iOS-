//
//  MYMeheaderView.h
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYMeheaderView : UIView
// 背景图片
@property(nonatomic,strong) UIImageView *backImage;
// 头像
@property(nonatomic,strong) UIButton *photoImage;
// 姓名
@property(nonatomic,strong) UILabel *nameLable;
// 性别
@property(nonatomic,strong) UIImageView *genderImage;

#warning 将来会有变动
// 等级
@property(nonatomic,strong) UILabel *level;

// 关注
@property(nonatomic,strong) UIButton *focusButton;
// 粉丝
@property(nonatomic,strong) UIButton *funsButton;
// 点赞
@property(nonatomic,strong) UIButton *praiseButton;


// 关注
@property(nonatomic,strong) UILabel *focusLableB;
// 粉丝
@property(nonatomic,strong) UILabel *funsLableB;
// 点赞
@property(nonatomic,strong) UILabel *praiseLableB;

@end
