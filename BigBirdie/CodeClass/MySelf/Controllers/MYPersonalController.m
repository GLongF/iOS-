//
//  MYPersonalController.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/8/16.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYPersonalController.h"
#import "MYPersonalHeaderView.h"
#import "MYPersonalCell.h"

@interface MYPersonalController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@end

@implementation MYPersonalController
- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   [self createTableView];
}

- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 50;
    [self.view addSubview:_tableView];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MYPersonalHeaderView *headerView = [[MYPersonalHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 80)];
    return headerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
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
