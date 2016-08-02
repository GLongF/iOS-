//
//  MYHotViewCell.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/7/26.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotViewCell.h"

@implementation MYHotViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.backgroundColor= [UIColor colorWithRed:0.9425 green:0.8752 blue:0.7971 alpha:0.436314655172414];
    // 名字
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 ,0,80, 40)];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_nameLabel];
    
}

@end
