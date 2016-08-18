//
//  MYAccountController.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/8/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYAccountController.h"
#import "MYRechargeView.h"
#import "MYEarningsView.h"

@interface MYAccountController ()
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) MYRechargeView *rechargeView; // 充值
@property (nonatomic,strong) MYEarningsView *earningsView; // 取现
@end

@implementation MYAccountController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.title = @"账户中心";
    [self setSegmentedController];
    
    self.rechargeView = [[MYRechargeView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 400 * kWidth_Scale) / 2, 64 + 80 * kWidth_Scale, 400 * kWidth_Scale , SCREEN_HEIGHT - (64 + 80 * kWidth_Scale))];
    [self.view addSubview:self.rechargeView];
    
    self.earningsView = [[MYEarningsView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 400 * kWidth_Scale) / 2, 64 + 80 * kWidth_Scale, 400 * kWidth_Scale , SCREEN_HEIGHT - (64 + 80 * kWidth_Scale))];
    
    
    
}

- (void)setSegmentedController {
    NSArray *items = @[@"充值",@"提现"];
    UISegmentedControl *accountSC = [[UISegmentedControl alloc] initWithItems:items];
    accountSC.selectedSegmentIndex = 0;
    accountSC.tintColor= [UIColor yellowColor];
    accountSC.frame = CGRectMake((SCREEN_WIDTH - 400 * kWidth_Scale) / 2, 64 + 10 * kWidth_Scale, 400 * kWidth_Scale, 60 * kWidth_Scale);
    [accountSC addTarget:self action:@selector(accountSCClick:) forControlEvents:(UIControlEventValueChanged)];
    [self.view addSubview:accountSC];
    
    
}

- (void)accountSCClick:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
            [self.earningsView removeFromSuperview];
            [self.view addSubview:self.rechargeView];
            break;
            
       case 1:
            [self.rechargeView removeFromSuperview];
            [self.view addSubview:self.earningsView];
            break;
            
        default:
            break;
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
