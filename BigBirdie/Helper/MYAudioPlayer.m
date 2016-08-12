//
//  MYAudioPlayer.m
//  BigBirdie
//
//  Created by mac on 16/8/11.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYAudioPlayer.h"


@interface MYAudioPlayer ()

@property (nonatomic, strong)NSTimer * timer;

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
        
        self.player = [[AVPlayer alloc] init];
        
        //添加通知，捕获播放结束的状态
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
    }
    return self;
}

-(void) playEnd:(NSNotification *)sender
{
    //暂停计时器
    [self pause];
    [self.delegate endOfPlayAction];
}

- (void)prepareToPlay {
    
    //如果当前currentItem存在，先将其监听这移除
    if (self.player.currentItem) {
        
        [self.player.currentItem removeObserver:self forKeyPath:@"status"];
    }
    
    AVPlayerItem * item = [[ AVPlayerItem alloc] initWithURL:[NSURL URLWithString:self.audioUrl]];
    [item addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    [self.player replaceCurrentItemWithPlayerItem:item];
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"status"]) {
        
        switch ([[change valueForKey:@"new"] integerValue]) {
                
            case AVPlayerItemStatusUnknown: {
                
                NSLog(@"不知道什么错误");
                NSError * error;
                [self.delegate prepareFailedWithError:error];
            }
                break;
            case AVPlayerItemStatusReadyToPlay: {
                
                [self.delegate prepareEndCanPlay];
            }
                break;
            case AVPlayerItemStatusFailed: {
                
                NSLog(@"准备失败");
                NSError * error;
                [self.delegate prepareFailedWithError:error];
            }
                break;
            default:
                break;
        }
    }
}

- (void)play {
    
    //本来就在播放状态
    if (!(self.timer == nil)) {
        
        return;
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    [self.player play];
}

- (void)pause {
    
    [self.timer invalidate];
    [self.player pause];
}

- (void)timerAction {
    
     [self.delegate getCurTime:[self valueToString:[self getCurTime]] totleTime:[self valueToString:[self getTotleTime]] progress:[self getProgress]];
}

- (void)seekToTimeWithProgress:(CGFloat)progress {
    
        // 先暂停
    [self pause];
        // 跳转
    [self.player seekToTime:CMTimeMake(progress * [self getTotleTime], 1) completionHandler:^(BOOL finished) {
            if (finished == YES) {
                [self play];
            }
    }];
}

- (NSInteger)getCurTime {
    
    if (self.player.currentItem) {
        
        NSLog(@" %lld",self.player.currentTime.value / self.player.currentTime.timescale);
        NSLog(@" %lld",self.player.currentItem.currentTime.value / self.player.currentItem.currentTime.timescale);
        return self.player.currentTime.value / self.player.currentTime.timescale;
    }
    return 0;
}

// 获取总时长
- (NSInteger)getTotleTime {
    
    CMTime totleTime = [self.player.currentItem duration];
    if (totleTime.timescale == 0) {
        
        return 1;
    }else {
        
        return totleTime.value /totleTime.timescale;
    }
}

// 获取当前播放进度
- (CGFloat)getProgress {
    
    return (CGFloat)[self getCurTime]/ (CGFloat)[self getTotleTime];
}

// 将整数秒转换为 00:00 格式的字符串
- (NSString *)valueToString:(NSInteger)value {
    
    return [NSString stringWithFormat:@"%.2ld:%.2ld",value/60,value%60];
}


@end
