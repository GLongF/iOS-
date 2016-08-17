//
//  BirdiePCH.h
//  BigBirdie
//
//  Created by 郭龙飞 on 16/7/26.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#ifndef BirdiePCH_h
#define BirdiePCH_h

#import "UIView+MYExtension.h"
#import "MYButton.h"
#import "Masonry.h"
#import "UIColor+Hex.h"
#import "ReactiveCocoa.h"
#import "UMSocial.h"


#define WeakSelf(s) __weak typeof(s) weak##s = s
#define StrongSelf(s) __strong typeof(s) s = weak##s

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define kWidth_Scale [UIScreen mainScreen].bounds.size.width / 414.0

#define FONT(s) [UIFont systemFontOfSize:s]

#define BASE_URL @"www.baidu.com"

#endif /* BirdiePCH_h */
