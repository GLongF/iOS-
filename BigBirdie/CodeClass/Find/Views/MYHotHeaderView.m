//
//  MYHotHeaderView.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/7/26.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotHeaderView.h"



@interface MYHotHeaderView ()



@end

@implementation MYHotHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 1.轮播图
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCROLL_HEIGHT)];
        [self addSubview:_scrollView];
        
        _scrollView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor yellowColor];
        
        // 2.排行榜背景
        _backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCROLL_HEIGHT + 10, SCREEN_WIDTH, IMAGE_HEIGHT)];
        [_backImage setImage:[UIImage imageNamed:@"4.jpg"]];
        [self addSubview:_backImage];
        
                    
    }
    return self;
}


@end
