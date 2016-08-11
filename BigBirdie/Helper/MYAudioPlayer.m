//
//  MYAudioPlayer.m
//  BigBirdie
//
//  Created by mac on 16/8/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYAudioPlayer.h"
#import <AVFoundation/AVFoundation.h>

@interface MYAudioPlayer ()

@property (nonatomic, strong) AVPlayer * player;
@property (nonatomic, strong) AVPlayerItem * playerItem;

@end

@implementation MYAudioPlayer

+ (instancetype)shareInstance {
    
    static MYAudioPlayer * audioPlayer = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        audioPlayer = [[MYAudioPlayer alloc] init];
    });
    return audioPlayer;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)setAudioUrl:(NSString *)audioUrl {
    
    _audioUrl = [audioUrl copy];
    NSURL * url = [NSURL URLWithString:audioUrl];
    self.playerItem = [AVPlayerItem playerItemWithURL:url];
    if (self.player == nil) {
        //第一次创建播放器
        
        self.player = [AVPlayer playerWithPlayerItem:self.playerItem];
    }else {
        //播放器已经创建 只需要替换资源
        [self.player play];
    }
}


@end
