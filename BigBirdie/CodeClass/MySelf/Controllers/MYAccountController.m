//
//  MYAccountController.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/8/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYAccountController.h"


@interface MYAccountController ()
@property (nonatomic,strong) UIScrollView * scrollView;
@end

@implementation MYAccountController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationController.title = @"账户中心";
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64 + 80 * kWidth_Scale,SCREEN_WIDTH , SCREEN_HEIGHT - (64 + 80 * kWidth_Scale))];
    self.scrollView.backgroundColor = [UIColor redColor];
    self.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 2, SCREEN_HEIGHT - (64 + 80 * kWidth_Scale));
    self.scrollView.bounces = NO;
    self.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.scrollView];
    
    [self setSegmentedController];
    
}

- (void)setSegmentedController {
    NSArray *items = @[@"充值",@"取现"];
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
//            [UIView animateWithDuration:1.0 // 动画时长
//                             animations:^{
            
//                             }];

            break;
            
       case 1:
            
            [UIView animateWithDuration:1.0 // 动画时长
                             animations:^{
                                 
                                 
                             }];

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
