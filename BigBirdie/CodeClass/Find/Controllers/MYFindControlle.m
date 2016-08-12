//
//  MYFindControlle.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/7/26.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYFindControlle.h"
#import "MYHotController.h"
#import "MYNewController.h"
#import "MYFouceController.h"


@interface MYFindControlle ()<VTMagicViewDelegate, VTMagicViewDataSource>


@end

@implementation MYFindControlle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

    self.magicView.navigationColor = [UIColor blackColor];
    self.magicView.sliderColor = [UIColor orangeColor];
    self.magicView.layoutStyle = VTLayoutStyleDivide;
    self.magicView.switchStyle = VTSwitchStyleDefault;
    self.magicView.sliderStyle = VTSliderStyleDefault;
    self.magicView.headerHeight = 20;
    self.magicView.headerHidden = NO;
    self.magicView.headerView.backgroundColor = [UIColor whiteColor];
    self.magicView.navigationHeight = 44;
    self.magicView.dataSource = self;
    self.magicView.delegate = self;
    [self.magicView reloadData];
    
    [self addLeftBtn];
    [self addRightBtn];
}

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    
    return @[@"热门", @"最新", @"关注"];
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {

    static NSString * itemId = @"itemID";
    UIButton * item = [magicView dequeueReusableItemWithIdentifier:itemId];
    if (!item) {
        
        item = [UIButton buttonWithType:UIButtonTypeCustom];
        [item setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return item;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex {
    
    if (pageIndex == 0) {
        
        static NSString * hotId = @"HOT_ID";
        MYHotController * hot = [magicView dequeueReusablePageWithIdentifier:hotId];
        if (!hot) {
            
            hot = [[MYHotController alloc] init];
            hot.title = @"热门";
        }
        return hot;
        
    }else if (pageIndex == 1) {

        static NSString * newId = @"NEW_ID";
        MYNewController * newC = [magicView dequeueReusablePageWithIdentifier:newId];
        if (!newC) {
            
            newC = [[MYNewController alloc] init];
            newC.title = @"最新";
        }
        return newC;
        
    }else {
        
        static NSString * fouceId = @"FOUCE_ID";
        MYFouceController * fouce = [magicView dequeueReusablePageWithIdentifier:fouceId];
        if (!fouce) {
            
            fouce = [[MYFouceController alloc] init];
            fouce.title = @"最新";
        }
        return fouce;
    }
}

- (void)addLeftBtn {
    UIButton *leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [leftBtn setImage:[UIImage imageNamed:@"search@2x"] forState:UIControlStateNormal];
    [[leftBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        NSLog(@"搜索。。。");
    }];

    self.magicView.leftNavigatoinItem = leftBtn;
}

- (void)addRightBtn {
    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    // 这里应该判断播放器的状态,给backImage的图片是否为动图
    [rightBtn setImage:[UIImage imageNamed:@"search@2x"] forState:UIControlStateNormal];
    [[rightBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"播放详情");
    }];
    
    self.magicView.rightNavigatoinItem = rightBtn;
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
