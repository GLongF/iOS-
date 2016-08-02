//
//  WaveView.m
//  100s
//
//  Created by 郭龙飞 on 16/7/13.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "WaveView.h"

@implementation WaveView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //得到当前上下文  
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGFloat height = self.bounds.size.height;
    [[UIColor redColor] setFill];
    for (int i = 0; i < self.dataSource.count; i++) {
        
        CGFloat orginX = (WAVE_SEPARATE + WAVE_WIDTH) * i;
        CGFloat orginY = height - height * [self.dataSource[i] doubleValue];
        CGContextFillRect(ctx, CGRectMake(orginX, orginY, WAVE_WIDTH, height * [self.dataSource[i] doubleValue]));
    }
}

- (void)addDataWithHeight:(CGFloat)heightScale {
    
    [self.dataSource addObject:@(heightScale)];
    self.contentSize = CGSizeMake((WAVE_WIDTH + WAVE_SEPARATE) * self.dataSource.count , self.bounds.size.height);
    [self setNeedsDisplay];
    
    [self setContentOffset:CGPointMake(self.dataSource.count * (WAVE_WIDTH + WAVE_SEPARATE), 0) animated:YES];
}

#pragma mark - getter
- (NSMutableArray *)dataSource {
    
    if (_dataSource == nil) {
        
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}


@end
