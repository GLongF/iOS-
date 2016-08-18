//
//  MYEarningsView.m
//  BigBirdie
//
//  Created by 郭龙飞 on 16/8/18.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYEarningsView.h"

@implementation MYEarningsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}


- (void)setUpView {
    self.backgroundColor = [UIColor yellowColor];
}

@end
