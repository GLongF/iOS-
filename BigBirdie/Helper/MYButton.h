//
//  MYButton.h
//  100s
//
//  Created by 郭龙飞 on 16/7/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MYButton;
typedef void(^MYButtonClickBlock)(MYButton *);

@interface MYButton : UIButton
/** 回调 */
@property (nonatomic,copy) MYButtonClickBlock block;

+ (instancetype)createMYButton;


@end
