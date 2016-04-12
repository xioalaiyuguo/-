//
//  homeworkTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HomeworkTableViewCell.h"
#import "Define.h"
@implementation HomeworkTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self) {
        self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
        self.cellView = [[UIView alloc]init];
        self.cellView.backgroundColor =  COLOR(248, 248, 248, 1);
        
        self.bgImageView = [[UIImageView alloc]init];
//        self.backgroundColor = [UIColor redColor];
        self.bgImageView.image = [UIImage imageNamed:@"math_work.png"];
        self.subImageView = [[UIImageView alloc]init];
        
        self.lab1 = [[UILabel alloc]init];
        self.lab1.font = [UIFont systemFontOfSize:15];
        
        self.lab2 = [[UILabel alloc]init];
        self.lab2.font = [UIFont systemFontOfSize:15];
        
        self.timaeLab = [[UILabel alloc]init];
        self.timaeLab.font = [UIFont systemFontOfSize:11];
        self.timaeLab.textColor = COLOR(150, 150,150, 1);
        self.timaeLab.textAlignment = NSTextAlignmentLeft;
        
        self.teacherNameLab = [[UILabel alloc]init];
        self.teacherNameLab.font = [UIFont systemFontOfSize:12];
        self.teacherNameLab.textAlignment = NSTextAlignmentCenter;

        
        [self.cellView addSubview:_bgImageView];
        [self.cellView addSubview:_subImageView];
        [self.cellView addSubview:_lab1];
        [self.cellView addSubview:_lab2];
        [self.cellView addSubview:_timaeLab];
         [self.cellView addSubview:_teacherNameLab];
        
        [self.contentView addSubview:_cellView];
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.cellView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 168.0/568.0*SCREEN_HEIGHT);
    self.bgImageView.frame = CGRectMake(14,18, SCREEN_WIDTH-28, 150.0/568.0*SCREEN_HEIGHT);
    self.lab1.frame = CGRectMake(40.0/320.0*SCREEN_WIDTH,80/568.0*SCREEN_HEIGHT, 237.0/320.0*SCREEN_WIDTH, 14.0/568.0*SCREEN_HEIGHT);
    self.lab2.frame = CGRectMake(40.0/320.0*SCREEN_WIDTH,110/568.0*SCREEN_HEIGHT, 237.0/320.0*SCREEN_WIDTH, 14.0/568.0*SCREEN_HEIGHT);
    self.timaeLab.frame = CGRectMake(SCREEN_WIDTH-95, 135/568.0*SCREEN_HEIGHT,76, 15);
    self.teacherNameLab.frame = CGRectMake(SCREEN_WIDTH/2-50, 45/568.0*SCREEN_HEIGHT,100, 15);
    
}


@end
