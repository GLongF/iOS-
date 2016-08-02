//
//  UIView+MYExtension.h
//  100s
//
//  Created by 郭龙飞 on 16/7/14.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XMGExtension)
@property (nonatomic, assign) CGSize size;
// 宽
@property (nonatomic, assign) CGFloat width;
// 高
@property (nonatomic, assign) CGFloat height;
//
@property (nonatomic, assign) CGFloat x;
//
@property (nonatomic, assign) CGFloat y;
//
@property (nonatomic, assign) CGFloat centerX;
//
@property (nonatomic, assign) CGFloat centerY;
// 左边界
@property (nonatomic,assign) CGFloat left;
// 右边界
@property (nonatomic,assign) CGFloat right;
// 上边界
@property (nonatomic,assign) CGFloat top;
// 下边界
@property (nonatomic,assign) CGFloat bottom;

//- (CGFloat)x;
//- (void)setX:(CGFloat)x;
/** 在分类中声明@property, 只会生成方法的声明, 不会生成方法的实现和带有_下划线的成员变量*/
@end
