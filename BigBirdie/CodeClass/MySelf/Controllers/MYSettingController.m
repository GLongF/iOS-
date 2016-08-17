//
//  MYSettingController.m
//  BigBirdie
//
//  Created by mac on 16/8/16.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYSettingController.h"
#import "MYSettingCellFir.h"
#import "MYSettingCellSec.h"
#import "MYSettingCellThi.h"
#import "MYSettingCellFou.h"

@interface MYSettingController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation MYSettingController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createTableView];
    [self getInfo];
}

- (void)getInfo {
    
    //得到缓存大小 以及 用户偏好设置之后 存到字典里 reload
    [self.tableView reloadData];
}

- (void)createTableView {

    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [self.view addSubview:_tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 9;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dataSource[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (indexPath.row <= 2) {
            
            MYSettingCellFir * cell = [[MYSettingCellFir alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
            [cell setDic:self.dataSource[indexPath.section][indexPath.row]];
            return cell;
        }else {
            
            MYSettingCellThi * cell = [[MYSettingCellThi alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
            [cell setDic:self.dataSource[indexPath.section][indexPath.row]];
            return cell;
        }
    }else if (indexPath.section == 1) {
        
        MYSettingCellSec * cell = [[MYSettingCellSec alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        [cell setDic:self.dataSource[indexPath.section][indexPath.row]];
        return cell;
    }else if (indexPath.section == 2) {
        
        MYSettingCellFir * cell = [[MYSettingCellFir alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        [cell setDic:self.dataSource[indexPath.section][indexPath.row]];
        return cell;
    }else {
        
        MYSettingCellFou * cell = [[MYSettingCellFou alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        [cell setDic:self.dataSource[indexPath.section][indexPath.row]];
        return cell;
    }
}



- (NSMutableArray *)dataSource {
    
    if (_dataSource == nil) {
        
        _dataSource = [NSMutableArray array];
        [_dataSource addObject:@[@{@"title":@"账户与安全",
                                   @"num":@(0)},
                                 @{@"title":@"黑名单",
                                   @"num":@(0)},
                                 @{@"title":@"消息提醒",
                                   @"num":@(0)},
                                 @{@"title":@"清除缓存",
                                   @"num":@(0)}]];
        [_dataSource addObject:@[@{@"title":@"禁止陌生人评论",
                                   @"num":@(0)},
                                 @{@"title":@"禁止下载自己作品",
                                   @"num":@(0)}]];
        [_dataSource addObject:@[@{@"title":@"帮助和反馈",
                                   @"num":@(0)},
                                 @{@"title":@"联系我们",
                                   @"num":@(0)},
                                 @{@"title":@"关于我们",
                                   @"num":@(0)}]];
        [_dataSource addObject:@[@{@"title":@"退出登录",
                                    @"num":@(0)}]];
    }
    
    return _dataSource;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
