//
//  MYHotHeaderView.h
//  BigBirdie
//
//  Created by 郭龙飞 on 16/7/26.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCROLL_HEIGHT 150  // 轮播图的高度
#define IMAGE_HEIGHT 150
#define  RANDOM_RGB arc4random_uniform(256) / 255.f



@interface MYHotHeaderView : UICollectionReusableView

// 轮播图
@property(nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,strong) UIImageView *backImage;




@end
