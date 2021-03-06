//
//  MYMeViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeViewController.h"
#import "MYMeCell.h"
#import "MYMeheaderView.h"
#import "MYPhotoController.h"
#import "MYEditController.h"

#import "MYFocusController.h"
#import "MYFunsController.h"
#import "MYCoinController.h"


#import "MYSongController.h"
#import "MYCollectController.h"
#import "MYHistoryController.h"
#import "MYAccountController.h"
#import "MYFeedbackController.h"
#import "MYSettingController.h"


@interface MYMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableImageArray;
@property (nonatomic,strong) NSMutableArray *tableDataArry;
@property (nonatomic,strong) MYMeheaderView *headerView;
@end

@implementation MYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的100s";
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    // 左button
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"message@2x.png" ] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction:)];
    
    // 右button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"eidt@2x.png" ] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction:)];
    // 初始化tableView
    [self setupTableView];
    
    // 数据源
    self.tableDataArry = @[@"我的声音",@"我的收藏",@"播放历史",@"账户中心",@"意见反馈",@"设置"].mutableCopy;
    self.tableImageArray = @[@"myVoice@2x.png",@"boxroom@2x.png",@"history@2x.png",@"acount@2x.png",@"suggest@2x.png",@"setting@2x.png"].mutableCopy;
    self.headerView.backImage.userInteractionEnabled = YES;

    [self showMoreController];
//    [self.headerView.focusButton addTarget:self action:@selector(showFocusController) forControlEvents:UIControlEventTouchUpInside];
}



#warning  会话界面

// 左button 私信
- (void)leftAction:(UIBarButtonItem *)sender {
  
}
// 右button 编辑
- (void)rightAction:(UIBarButtonItem *)sender {
    MYEditController *edit = [[MYEditController alloc] init];
    edit.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:edit animated:YES];
}


#pragma mack - 关注  粉丝 试票
- (void)showMoreController {
    // 关注
    [[self.headerView.focusButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        MYFocusController *focusVC = [[MYFocusController alloc] init];
        [self.navigationController pushViewController:focusVC animated:YES];
    }];
    // 粉丝
    [[self.headerView.funsButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        MYFunsController *funsVC = [[MYFunsController alloc] init];
        [self.navigationController pushViewController:funsVC animated:YES];

    }];
    // 试票
    [[self.headerView.coinButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        MYCoinController *coinVC = [[MYCoinController alloc] init];
        [self.navigationController pushViewController:coinVC animated:YES];

    }];

}


#pragma mark -- tableView

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[MYMeCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];
    
    self.headerView = [[MYMeheaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 800 / 3 * kWidth_Scale)];
    
    @weakify(self);
    [self.headerView.subject subscribeNext:^(id x) {
        @strongify(self);
        MYPhotoController * photoVC = [[MYPhotoController alloc] init];
        [self.navigationController pushViewController:photoVC animated:YES];
    }];
    
   
    self.tableView.tableHeaderView = self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150 / 3 * kWidth_Scale;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableDataArry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYMeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.lable.text = self.tableDataArry[indexPath.row];
    cell.img.image = [UIImage imageNamed:self.tableImageArray[indexPath.row]];
    cell.backgroundColor = [UIColor blackColor];
    
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor colorWithRed:35 green:35 blue:35 alpha:0.1];
    return cell;
}
// 页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                MYSongController *songVC = [[MYSongController alloc]init];
                songVC.title = @"我的声音";
                [songVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:songVC animated:YES];
            }
            break;
            
        case 1:
            {
              MYCollectController *collectVC = [[MYCollectController alloc]init];
                collectVC.title = @"我的收藏";
                [collectVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:collectVC animated:YES];
            }
            break;
        
        case 2:
           
            {
                MYHistoryController *historyVC = [[MYHistoryController alloc]init];
                historyVC.title = @"播放历史";
                [historyVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:historyVC animated:YES];
            }
            break;
        
        case 3:
            {
                MYAccountController *accountVC = [[MYAccountController alloc]init];
                accountVC.title = @"账户中心";
                [accountVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:accountVC animated:YES];
            }
             break;
        
        case 4:
            {
                MYFeedbackController *feedbackVC = [[MYFeedbackController alloc]init];
                feedbackVC.title = @"意见反馈";
                [feedbackVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:feedbackVC animated:YES];
            }
            break;
        
        case 5:
            {
                MYSettingController *settingVC = [[MYSettingController alloc]init];
                settingVC.title = @"设置";
                
                [settingVC setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:settingVC animated:YES];
            }

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
