//
//  MYMeCell.m
//  100s
//
//  Created by 郭龙飞 on 16/7/15.
//  Copyright © 2016年 郭龙飞. All rights reserved.
//

#import "MYMeCell.h"

@implementation MYMeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpView];
    }
    return self;
}


- (void)setUpView{
   
    self.img = [[UIImageView alloc] initWithFrame:CGRectMake(20,15, 25, 25)];
    [self.contentView addSubview:self.img];
    self.lable = [[UILabel alloc] initWithFrame:CGRectMake(self.img.left + 40, 5, 100, 44)];
    self.lable.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.lable];
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
