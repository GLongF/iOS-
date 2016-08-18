//
//  MYSongController.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/8/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYCollectController.h"
#import "MYCollectCell.h"

@interface MYCollectController () <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end


@implementation MYCollectController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self createTableView];
}

- (void)createTableView {
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = 80;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[MYCollectCell class] forCellReuseIdentifier:@"MYCollectCellID"];
    
    
    [self createSearchBar];
}

//添加搜索框
- (void)createSearchBar {
    
    //自定义
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MYCollectCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MYCollectCellID"];
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 返回多选样式
    return UITableViewCellEditingStyleDelete | UITableViewCellEditingStyleInsert;
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
