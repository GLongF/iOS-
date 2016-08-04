//
//  MYHotHeadeView.h
//  BigBirdie
//
//  Created by mac on 16/8/3.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYHotHeaderView : UICollectionReusableView

@property (nonatomic, copy)void (^didSelectBannerWithIndex)(NSInteger index);

- (void)reloadWithImageUrlArray:(NSArray <NSString *>*)array;

@end
