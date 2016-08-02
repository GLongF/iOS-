//
//  UIView+MYExtension.m
//  100s
//
//  Created by 郭龙飞 on 16/7/14.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "UIView+MYExtension.h"

@implementation UIView (XMGExtension)

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
// 左边界
- (void)setLeft:(CGFloat)newleft {
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}
- (CGFloat)left {
    return self.frame.origin.x;
}
// 右边界
- (void)setRight:(CGFloat)newright {
    CGRect newframe = self.frame;
    newframe.origin.x = newright - newframe.size.width;
    self.frame = newframe;
}
- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}
// 上边界
- (void)setTop:(CGFloat)newtop {
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}
- (CGFloat)top{
    return self.frame.origin.y;
}
// 下边界
- (void)setBottom:(CGFloat)newbottom {
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - newframe.size.height;
    self.frame = newframe;
}
- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}
@end

