//
//  MYHotHeadeView.m
//  BigBirdie
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotHeaderView.h"
#import "SDCycleScrollView.h"

@interface MYHotHeaderView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView * bannerView;

@end

@implementation MYHotHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self createBannerViewWithFrame:frame];
    }
    return self;
}

- (void)createBannerViewWithFrame:(CGRect)frame {
    
    _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:frame delegate:self placeholderImage:nil];
    [self addSubview:_bannerView];
}
                   
- (void)reloadWithImageUrlArray:(NSArray <NSString *>*)array {
    
    _bannerView.imageURLStringsGroup = array;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    self.didSelectBannerWithIndex(index);
}

@end
