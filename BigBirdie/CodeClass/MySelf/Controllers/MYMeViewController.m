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

#import "MYEditController.h"

@interface MYMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *tableImageArray;
@property (nonatomic,strong) NSMutableArray *tableDataArry;
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
    self.tableDataArry = @[@"我的声音",@"我的收藏",@"播放历史",@"账户中心",@"意见反馈",@"联系我们",@"设置"].mutableCopy;
    self.tableImageArray = @[@"myVoice@2x.png",@"boxroom@2x.png",@"history@2x.png",@"acount@2x.png",@"suggest@2x.png",@"callme@2x.png",@"setting@2x.png"].mutableCopy;
    
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

#pragma mark -- tableView

- (void)setupTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource =self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self.tableView registerClass:[MYMeCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];
    
    MYMeheaderView *headerView = [[MYMeheaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 800 / 3 * kWidth_Scale)];
    self.tableView.tableHeaderView = headerView;
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
        case 1:
            // code
            break;
            
        case 2:
            // code
            break;
        
        case 3:
            // code
            break;
        
        case 4:
            // cod
             break;
        
        case 5:
            // code
            break;
        
        case 6:
            // cod
             break;
        
        case 7:
            // code
            break;
        
        case 8:
            // cod
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
