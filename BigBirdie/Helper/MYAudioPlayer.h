//
//  MYAudioPlayer.h
//  BigBirdie
//
//  Created by mac on 16/8/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@protocol MYAudioPlayerDelegate <NSObject>

//定时器触发的刷新UI
//参数：curTime当前播放时间（格式为xx:xx的字符串）totleTime总时间（格式为xx:xx的字符串）progress播放进度
- (void)getCurTime:(NSString *)curTime totleTime:(NSString *)totleTime progress:(CGFloat)progress;

//播放完成后的回调
- (void)endOfPlayAction;

//准备完成后的回调
- (void)prepareEndCanPlay;

//准备时 发生错误
- (void)prepareFailedWithError:(NSError *)error;

@end


@interface MYAudioPlayer : NSObject

//音频地址
@property (nonatomic, copy)   NSString * audioUrl;
//播放器
@property (nonatomic, strong) AVPlayer * player;
//播放资源
@property (nonatomic, strong) AVPlayerItem * playerItem;

@property (nonatomic, weak)   id<MYAudioPlayerDelegate> delegate;


+ (instancetype)shareInstance;

//替换资源后，应该调用这个准备播放，在准备完成后，会有准备完成后的回调，然后再调用play方法进行播放
- (void)prepareToPlay;
//播放，在暂停后可以调用这个方法继续播放
- (void)play;
//暂停
- (void)pause;
//跳转到某个进度播放
- (void)seekToTimeWithProgress:(CGFloat)progress;

@end
