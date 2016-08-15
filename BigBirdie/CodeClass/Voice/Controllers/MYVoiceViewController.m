//
//  MYVoiceViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYVoiceViewController.h"

#import "MYRecordController.h"
#import "MYLivingController.h"

@interface MYVoiceViewController ()


@end

@implementation MYVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.backgroundColor = [UIColor blackColor];
    


    self.view.backgroundColor = [UIColor orangeColor];
    UIButton *recordBtn = [[UIButton alloc] init];
    recordBtn.frame = CGRectMake(100, 100, 200, 200);
    recordBtn.backgroundColor = [UIColor blueColor];
    [recordBtn setTitle:@"录音" forState:UIControlStateNormal];
    [self.view addSubview:recordBtn];
    [[recordBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        MYRecordController *recordVC = [[MYRecordController alloc] init];
        recordVC.navigationItem.title = @"录音"; 
        [self.navigationController pushViewController:recordVC animated:YES];
    }];
    
    
    UIButton *livingBtn = [[UIButton alloc] init];
    livingBtn.frame = CGRectMake(100, 400, 200, 200);
    livingBtn.backgroundColor = [UIColor redColor];
    [livingBtn setTitle:@"直播" forState:UIControlStateNormal];
    [self.view addSubview:livingBtn];
    [[livingBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        MYLivingController *livingVC = [[MYLivingController alloc] init];
        livingVC.navigationItem.title = @"直播";
        [self.navigationController pushViewController:livingVC animated:YES];
    }];

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


