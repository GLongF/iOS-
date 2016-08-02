//
//  PopView2.m
//  popView
//
//  Created by mac on 16/7/25.
//  Copyright © 2016年 ZYQ. All rights reserved.
//

#import "PopView2.h"
#import <math.h>
#import "POP.h"
#define  RANDOM_RGB arc4random_uniform(256) / 255.f



@interface PopView2 ()

@property (nonatomic, strong)NSArray<NSString *> * titles;

@property (nonatomic, assign)NSInteger btnCount;

@property (nonatomic, strong)NSMutableArray<NSValue *> * btnCenter;

@property (nonatomic, assign)CGPoint center;

@property (nonatomic, assign)CGFloat viewRadius;

@property (nonatomic, assign)CGFloat subViewRadius;

@property (nonatomic, strong)UIView * view;

@property (nonatomic, assign)CGFloat length;

@property (nonatomic, strong)UIView * backView;

@end
@implementation PopView2


- (instancetype)initWithCenter:(CGPoint)center viewRadius:(CGFloat)viewRadius subViewRadius:(CGFloat)subViewRadius length:(CGFloat)length titles:(NSArray *)titles addView:(UIView *)view {
    
    if (self = [super init]) {
        
        self.view = view;
        self.viewRadius = viewRadius;
        self.subViewRadius = subViewRadius;
        self.center = center;
        self.length = length;
        self.titles = titles;
        self.btnCount = titles.count;
        [self createSubViews];
        [self calcCenter];
    }
    return self;
}

- (void)createSubViews {
    
    for (int i = 0; i < self.btnCount + 1; i++) {
        UIButton * btn = nil;
        
        if (i == self.btnCount) {
            btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 2 * _viewRadius, 2 * _viewRadius)];
            [btn setTitle:@"散" forState:UIControlStateNormal];
            [btn setTitle:@"合" forState:UIControlStateSelected];
            [self setBtnBorder:btn radius:_viewRadius];
        }else {
            
            btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 2 * _subViewRadius, 2 * _subViewRadius)];
            [btn setTitle:self.titles[i] forState:UIControlStateNormal];
            [self setBtnBorder:btn radius:_subViewRadius];
        }
        
        btn.center          = self.center;
        btn.backgroundColor = [UIColor colorWithRed:RANDOM_RGB green:RANDOM_RGB blue:RANDOM_RGB alpha:1];
        btn.tag             = 1000000 + i;
        
        [btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
        
        [self.view addSubview:btn];
    }
}

- (void)onClick:(UIButton *)btn {
    
    if (btn.tag - 1000000 != self.btnCount) {
        
        self.clickWithIndex(btn.tag - 1000000);
        return;
    }
    
    //点击合或散
    btn.selected = !btn.selected;
    if (btn.selected == YES) {
        //散开
        
        [self open];
    }else {
        
        [self close];
    }
}

- (void)open {
    
    for (int i = 0; i < self.btnCount; i++) {
        
        POPSpringAnimation * animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animation.springBounciness = 20.f;
        animation.springSpeed      = 20.f;
        animation.beginTime        = CACurrentMediaTime();
        animation.toValue          = self.btnCenter[i];
        
        UIButton * btn             = (id)[self.view viewWithTag:1000000 + i];
        [btn pop_addAnimation:animation forKey:@"animation"];
    }
    
    //添加遮盖 在第一个button下面
    UIView * view = [self.view viewWithTag:1000000];
    [self.view insertSubview:self.backView belowSubview:view];
}

- (void)close {
    
    for (int i = 0; i < self.btnCount; i++) {
        
        
        POPSpringAnimation * animation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
        animation.springBounciness = 0;
        animation.springSpeed      = 12.f;
        animation.beginTime        = CACurrentMediaTime();
        animation.toValue          = [NSValue valueWithCGPoint:self.center];
        
        UIButton * btn             = (id)[self.view viewWithTag:1000000 + i];
        [btn pop_addAnimation:animation forKey:@"animation"];
    }
    [self.backView removeFromSuperview];
}

- (void)setBtnBorder:(UIButton *)btn radius:(CGFloat)radius{
    
    btn.layer.cornerRadius  = radius;
    btn.layer.masksToBounds = YES;
}

- (void)calcCenter {
    
    CGFloat radian = M_PI / (self.btnCount - 1);
    
    for (int i = 0; i < self.btnCount; i++) {
        
        CGFloat x = self.center.x - self.length * cos(radian * i);
        CGFloat y = self.center.y - self.length * sin(radian * i);
        CGPoint point = CGPointMake(x, y);
        [self.btnCenter addObject:[NSValue valueWithCGPoint:point]];
    }
}

- (NSMutableArray *)btnCenter {
    
    if (!_btnCenter) {
        
        _btnCenter = [NSMutableArray array];
    }
    return _btnCenter;
}

- (UIView *)backView {
    
    if (!_backView) {
        
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _backView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        //添加手势
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
        [_backView addGestureRecognizer:tap];
    }
    
    return _backView;
}

- (void)tap {
    
    UIButton * btn = (id)[self.view viewWithTag:1000000 + self.btnCount];
    [self onClick:btn];
}

@end
