//
//  WaveView.h
//  100s
//
//  Created by 郭龙飞 on 16/7/13.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WAVE_WIDTH 6
#define WAVE_SEPARATE 2

@interface WaveView : UIScrollView

@property (nonatomic, strong)NSMutableArray <NSNumber *>* dataSource;

- (void)addDataWithHeight:(CGFloat)heightScale;

@end