//
//  PopView2.h
//  popView
//
//  Created by mac on 16/7/25.
//  Copyright © 2016年 ZYQ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PopView2 : NSObject

@property (nonatomic, copy)void(^clickWithIndex)(NSInteger index);

/**
 *
 *  center 在父视图中的位置
 *  viewRadius 父button的半径
 *  subViewRadius 子button的半径
 *  length 扩散的半径
 *  titles button的标题
 *  addView 添加的父视图
 */
- (instancetype)initWithCenter:(CGPoint)center viewRadius:(CGFloat)viewRadius subViewRadius:(CGFloat)subViewRadius length:(CGFloat)length titles:(NSArray *)titles addView:(UIView *)view;


@end
