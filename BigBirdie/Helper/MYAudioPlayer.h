//
//  MYAudioPlayer.h
//  BigBirdie
//
//  Created by mac on 16/8/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MYAudioPlayer : NSObject

@property (nonatomic, copy) NSString * audioUrl;

+ (instancetype)shareInstance;

- (void)play;
- (void)pause;
- (void)stop;


@end
