//
//  MYButton.m
//  100s
//
//  Created by 郭龙飞 on 16/7/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYButton.h"

@implementation MYButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}
- (void)click:(MYButton *)btn {
    if (_block) {
        _block(btn);
    }
}

+ (instancetype)createMYButton {
    return [MYButton buttonWithType:UIButtonTypeCustom];
}

@end
