//
//  MYTabBarViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYTabBarViewController.h"
#import "MYFindControlle.h"
#import "MYVoiceViewController.h"
#import "MYMeViewController.h"
#import "MYTabBar.h"

@interface MYTabBarViewController ()

@end

@implementation MYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置所有UITabBarItem的文字属性
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self setupChildVc:[[MYFindControlle alloc] init] title:@"首页" image:@"shouye@2x.png" selectedImage:@"shouye@3x.png"];
    [self setupChildVc:[[MYVoiceViewController alloc] init] title:@"voice" image:nil selectedImage:nil];
    [self setupChildVc:[[MYMeViewController alloc] init] title:@"我的" image:@"MY@2x.png" selectedImage:@"MY@3x.png"];
    
    
    // 更换tabBar
    [self setValue:[[MYTabBar alloc] init] forKeyPath:@"tabBar"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 * 初始化子控制器
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title  image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置文字和图片
    UINavigationController *naC = [[UINavigationController alloc] initWithRootViewController:vc];
    naC.navigationBar.translucent = NO;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    [self addChildViewController:naC];
   
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
