//
//  MYHotChartsView.m
//  BigBirdie
//
//  Created by mac on 16/8/8.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYHotChartsView.h"
#import <pop/pop.h>

@interface MYHotChartsView () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UIImageView * topImageView;
@property (nonatomic, strong)UITableView * tableView;
//@property (nonatomic, strong)UILabel * titleLabel;
@property (nonatomic, strong)UIButton * lookMoreBtn;
@property (nonatomic, assign)BOOL isShow;
//@property ()

@end

@implementation MYHotChartsView


- (void)drawRect:(CGRect)rect {
    
    //绘制圆角矩形
    CGFloat xMax = rect.size.width;
    CGFloat yMax = rect.size.height;
    CGFloat cornerRadius = 20.f;
    CGFloat rightWidth = 10.f;
    //得到上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //绘制
    CGContextMoveToPoint(ctx, xMax, yMax / 3.f);
    CGContextAddLineToPoint(ctx, xMax - rightWidth, yMax / 3.f + 30);
    CGContextAddLineToPoint(ctx, xMax - rightWidth, yMax - 20);
    CGContextAddArcToPoint(ctx, xMax - rightWidth, yMax, xMax - rightWidth - cornerRadius, yMax, cornerRadius);
    CGContextAddLineToPoint(ctx, cornerRadius, yMax);
    CGContextAddArcToPoint(ctx, 0, yMax, 0, yMax - cornerRadius, cornerRadius);
    CGContextAddLineToPoint(ctx, 0, cornerRadius);
    CGContextAddArcToPoint(ctx, 0, 0, cornerRadius, 0, cornerRadius);
    CGContextAddLineToPoint(ctx, xMax - cornerRadius, 0);
    CGContextAddArcToPoint(ctx, xMax, 0, xMax, cornerRadius, cornerRadius);
    
    [[UIColor whiteColor] setFill];
    CGContextFillPath(ctx);
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.isShow = NO;
        [self createLabel];
        [self createTableview];
        [self addTap];
    }
    return self;
}
- (void)createLabel {
    
    UILabel * label = [[UILabel alloc] init];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.top.equalTo(self);
        make.height.equalTo(@30);
    }];
    label.font = [UIFont boldSystemFontOfSize:24];
    label.text = @"排行榜";
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    UIButton * button = [[UIButton alloc] init];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(@30);
        make.bottom.equalTo(self);
    }];
    [button setTitle:@"查看更多" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
       
        NSLog(@"查看更多。。。");
    }];
}
- (void)createTableview {
    
    UITableView * tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.width - 10, self.height - 30 - 30) style:UITableViewStylePlain];
    tableview.delegate = self;
    tableview.dataSource = self;
    tableview.rowHeight = tableview.height / 3.f;
    tableview.bounces = NO;
    tableview.scrollEnabled = NO;
    
    [self addSubview:tableview];
    self.tableView = tableview;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"Id"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击了cell");
}

- (void)addTap {
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideOrShow)];
    [self addGestureRecognizer:tap];
}

- (void)hideOrShow {
    
    if (self.isShow == NO) {
        
        POPBasicAnimation * animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, self.y, self.width, self.height)];
        animation.beginTime = CACurrentMediaTime();
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self pop_addAnimation:animation forKey:@"popShow"];
        self.isShow = YES;
    }else {
    
        POPBasicAnimation * animation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
        animation.toValue = [NSValue valueWithCGRect:CGRectMake(- SCREEN_WIDTH + 10, self.y, self.width, self.height)];
        animation.beginTime = CACurrentMediaTime();
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [self pop_addAnimation:animation forKey:@"popHide"];
        self.isShow = NO;
    }
}
@end
