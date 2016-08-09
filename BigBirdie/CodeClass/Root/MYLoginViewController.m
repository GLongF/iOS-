//
//  MYLoginViewController.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/8/3.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYLoginViewController.h"

@interface MYLoginViewController ()
@property (nonatomic,strong) UIImageView *backImage;
@property (nonatomic,strong) UIButton *weixinButton;
@property (nonatomic,strong) UIButton *qqButton;
@property (nonatomic,strong) UIButton *weiboButton;
@property (nonatomic,strong) UIButton *phoneButton;
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *button;
@end

@implementation MYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    // 背景
    self.backImage = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.backImage setImage:[UIImage imageNamed:@"loginImage@2x.png"]];
    [self.view addSubview:self.backImage];
    // 三方登录 微信
    self.weixinButton = [[UIButton alloc] init];
    [self.weixinButton setImage:[UIImage imageNamed: @"weixin@2x.png"] forState:UIControlStateNormal];
    self.weixinButton.layer.cornerRadius = 50 * kWidth_Scale;
    [self.backImage addSubview:self.weixinButton];
    [self.weixinButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.backImage).offset(154 / 3 * kWidth_Scale);
        make.bottom.mas_equalTo(self.backImage.bottom).offset( - 221 * kWidth_Scale);
        make.width.height.equalTo(@(50 * kWidth_Scale));
    }];
    
    [[self.weixinButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
        
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
            
            if (response.responseCode == UMSResponseCodeSuccess) {
                
                NSDictionary *dict = [UMSocialAccountManager socialAccountDictionary];
                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
                
            }
            
        });
    }];

    // qq
    self.qqButton = [[UIButton alloc] init];
    [self.qqButton setImage:[UIImage imageNamed: @"qq@2x.png"] forState:UIControlStateNormal];
    self.qqButton.layer.cornerRadius = 50 * kWidth_Scale;
    [self.backImage addSubview:self.qqButton];
    [self.qqButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.weixinButton).offset(87 * kWidth_Scale);
        make.bottom.mas_equalTo(self.backImage).offset( - 221 * kWidth_Scale);
        make.width.height.equalTo(@(50 * kWidth_Scale));
    }];
    // 微博
    self.weiboButton = [[UIButton alloc] init];
    [self.weiboButton setImage:[UIImage imageNamed: @"weibo@2x.png"] forState:UIControlStateNormal];
    self.weiboButton.layer.cornerRadius = 50 * kWidth_Scale;
    [self.backImage addSubview:self.weiboButton];
    [self.weiboButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.qqButton).offset(87 * kWidth_Scale);
        make.bottom.mas_equalTo(self.backImage).offset( - 221 * kWidth_Scale);
        make.width.height.equalTo(@(50 * kWidth_Scale));
    }];
    
       // 手机
    self.phoneButton = [[UIButton alloc] init];
    [self.phoneButton setImage:[UIImage imageNamed: @"phone@2x.png"] forState:UIControlStateNormal];
    self.phoneButton.layer.cornerRadius = 50 * kWidth_Scale;
    [self.backImage addSubview:self.phoneButton];
    [self.phoneButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.weiboButton).offset(87 * kWidth_Scale);
        make.bottom.mas_equalTo(self.backImage).offset( - 221 * kWidth_Scale);
        make.width.height.equalTo(@(50 * kWidth_Scale));
    }];
    // 提示
    self.label = [[UILabel alloc] init];
    self.label.text = @"登陆既代表您同意";
    self.label.font = [UIFont systemFontOfSize:36 / 3 * kWidth_Scale];
    self.label.textColor = [UIColor colorWithHexString:@"aeabab"];
    [self.backImage addSubview:self.label];
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.backImage).offset(222 / 3 * kWidth_Scale);
        make.bottom.mas_equalTo(self.backImage).offset(- 447 / 3 * kWidth_Scale);
        make.width.equalTo(@(101 * kWidth_Scale));
        make.height.equalTo(@(15 * kWidth_Scale));
    }];
  
    // 条款
    self.button = [[UIButton alloc] init];
    [self.button setTitle:@"试试的服务条款及隐私条款" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor colorWithHexString:@"ae791e"] forState:UIControlStateNormal];
    [self.button.titleLabel setFont:[UIFont systemFontOfSize:36 / 3 * kWidth_Scale]];
    [self.backImage addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.label).offset(95 * kWidth_Scale);
        make.bottom.mas_equalTo(self.backImage).offset(- 447 / 3 * kWidth_Scale);
        make.width.equalTo(@(438 / 3 * kWidth_Scale));
        make.height.equalTo(@(15 * kWidth_Scale));

    }];

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
