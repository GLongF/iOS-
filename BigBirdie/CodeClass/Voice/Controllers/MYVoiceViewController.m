//
//  MYVoiceViewController.m
//  100s
//
//  Created by 郭龙飞 on 16/7/10.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYVoiceViewController.h"
#import "MYButton.h"
#import <AVFoundation/AVFoundation.h>
#import "WaveView.h"

@interface MYVoiceViewController ()

@property (nonatomic, strong)AVAudioRecorder * recorder;
@property (nonatomic, strong)AVAudioPlayer * player;
//绘制声波图像
@property (nonatomic, strong)NSTimer * timer;

@property (nonatomic, strong)WaveView * waveView;

@end

@implementation MYVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    // self.title = @"luyin";
    [self createBtn];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    _waveView = [[WaveView alloc] initWithFrame:CGRectMake(0, 500, SCREEN_WIDTH, 100)];
    _waveView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_waveView];
}

- (void)createBtn {
    
    MYButton * recordBtn = [[MYButton alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH - 40, 40)];
    [recordBtn setTitle:@"录制" forState:UIControlStateNormal];
    [self.view addSubview:recordBtn];
    WeakSelf(self);
    [recordBtn setBlock:^(MYButton * btn) {
        //开始录制
        StrongSelf(self);
        //配乐
        if ([self.player prepareToPlay]) {
            
            [self.player play];
        }else {
            
            NSLog(@"播放失败");
        }
        
        //录制
        if ([self.recorder prepareToRecord]) {
            
            [self.recorder record];
            [self.timer setFireDate:[NSDate distantPast]];
        }else {
            
            NSLog(@"录制失败");
        }
    }];
    
    
    MYButton * pauseBtn = [[MYButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(recordBtn.frame) + 100, SCREEN_WIDTH - 40, 40)];
    [pauseBtn setTitle:@"暂停" forState:UIControlStateNormal];
    [self.view addSubview:pauseBtn];
    [pauseBtn setBlock:^(MYButton * btn) {
        //暂停
        StrongSelf(self);
        [self.player pause];
        [self.recorder pause];
        [self.timer setFireDate:[NSDate distantFuture]];
    }];
    
    MYButton * stopBtn = [[MYButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(pauseBtn.frame) + 100, SCREEN_WIDTH - 40, 40)];
    [stopBtn setTitle:@"停止" forState:UIControlStateNormal];
    [self.view addSubview:stopBtn];
    [stopBtn setBlock:^(MYButton * btn) {
        //停止并保存
        [self.player stop];
        [self.recorder stop];
        [self.timer invalidate];
        
    }];
}

#pragma mark - getter
- (AVAudioPlayer *)player {
    
    if (_player == nil) {
        
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Ronald Jenkees-Super-Fun" ofType:@"mp3"]] error:nil];
    }
    return _player;
}

- (AVAudioRecorder *)recorder {
    
    if (_recorder == nil) {
        
        NSString * filePath = [NSString stringWithFormat:@"%@/tmp/111.aac", NSHomeDirectory()];
        
        NSLog(@"%@", NSHomeDirectory());
        NSMutableDictionary * settings = [NSMutableDictionary dictionary];
        //设置格式
        [settings setObject:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
        //设置录音采样率(Hz)
        [settings setObject:[NSNumber numberWithFloat:44100] forKey:AVSampleRateKey];
        //录音通道数  1 或 2
        [settings setObject:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
        //线性采样位数  8、16、24、32
        [settings setObject:[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
        //录音的质量
        [settings setObject:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVEncoderAudioQualityKey];
        _recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:filePath] settings:settings error:nil];
        _recorder.meteringEnabled = YES;
    }
    
    return _recorder;
}

- (NSTimer *)timer {
    
    if (_timer == nil) {
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerClick) userInfo:nil repeats:YES];
        _timer.fireDate = [NSDate distantFuture];
    }
    return _timer;
}

#pragma mark - 时钟触发
- (void)timerClick {
    
    //得到分贝大小
    [self.recorder updateMeters];
    CGFloat power = [self.recorder averagePowerForChannel:0];
    CGFloat scale = (1.f/160.f) * (power + 160.f);
    NSLog(@"%lf", scale);
    [_waveView addDataWithHeight:scale];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


