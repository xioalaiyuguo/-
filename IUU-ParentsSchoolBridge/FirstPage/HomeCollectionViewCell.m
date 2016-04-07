//
//  HomeCollectionViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HomeCollectionViewCell.h"
#import "Define.h"
@implementation HomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.picView = [[UIImageView alloc]init];
        [self.contentView addSubview:_picView];
        
        self.titleLab = [[UILabel alloc]init];
        self.titleLab.font = FONT(12);
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        self.titleLab.textColor = COLOR(150, 150, 150, 1);
        [self.contentView addSubview:self.titleLab];
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.picView.frame = CGRectMake(40, 20, 30.0/320.0*SCREEN_WIDTH, 30.0/568.0*SCREEN_HEIGHT);
    self.titleLab.frame = CGRectMake(15, 60, 80.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT);
}
@end
