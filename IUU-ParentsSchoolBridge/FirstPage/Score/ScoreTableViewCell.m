//
//  ScoreTableViewCell.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "ScoreTableViewCell.h"
#import "Define.h"
@implementation ScoreTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backImageView = [[UIImageView alloc]init];
        self.backImageView.image = [UIImage imageNamed:@"20080519102858444"];

        self.backImageView.layer.cornerRadius = 5;
        [self.contentView addSubview:self.backImageView];
        
        self.TimesLab = [[UILabel alloc]init];
//        self.TimesLab.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"泥色"]];
        self.TimesLab.font = FONT(15);
        self.TimesLab.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.TimesLab];
        
        self.ChineseLab = [[UILabel alloc]init];
        self.ChineseLab.font = FONT(12);
        [self.contentView addSubview:self.ChineseLab];
        self.MathLab = [[UILabel alloc]init];
        self.MathLab.font = FONT(12);
        [self.contentView addSubview:self.MathLab];
        self.EnglishLab = [[UILabel alloc]init];
        self.EnglishLab.font = FONT(12);
        [self.contentView addSubview:self.EnglishLab];
        self.TotalLab = [[UILabel alloc]init];
        self.TotalLab.font = FONT(12);
        [self.contentView addSubview:self.TotalLab];
        
        self.detailLab1 = [[UILabel alloc]init];
//        self.detailLab1.numberOfLines = 0;
        self.detailLab1.font = FONT(12);
        [self.contentView addSubview:self.detailLab1];
        self.detailLab2 = [[UILabel alloc]init];
//        self.detailLab2.numberOfLines = 0;
        self.detailLab2.font = FONT(12);
        [self.contentView addSubview:self.detailLab2];
        self.detailLab3 = [[UILabel alloc]init];
//        self.detailLab3.numberOfLines = 0;
        self.detailLab3.font = FONT(12);
        [self.contentView addSubview:self.detailLab3];
        self.detailLab4 = [[UILabel alloc]init];
        self.detailLab4.font = FONT(12);
        [self.contentView addSubview:self.detailLab4];
//        self.detailLab4.numberOfLines = 0;
    
        self.classLab = [[UILabel alloc]init];
        self.classLab.font = FONT(12);
        [self.contentView addSubview:self.classLab];
        self.schoolLab = [[UILabel alloc]init];
        self.schoolLab.font = FONT(12);
        [self.contentView addSubview:self.schoolLab];
        
    }
    
    return self;
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    self.backImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 165.0/568.0*SCREEN_HEIGHT);
    self.TimesLab.frame = CGRectMake(130, 20, 80.0/320.0*SCREEN_WIDTH, 25.0/568.0*SCREEN_HEIGHT);
    
    self.ChineseLab.frame = CGRectMake(45, 50, 40.0/320*SCREEN_WIDTH, 13.0/568.0*SCREEN_HEIGHT);
    self.detailLab1.frame = CGRectMake(95, 50, 33.0/320.0*SCREEN_WIDTH, 13.0/568.0*SCREEN_HEIGHT);
    
    self.MathLab.frame = CGRectMake(45, 75, 40.0/320.0*SCREEN_WIDTH, 13.0/568.0*SCREEN_HEIGHT);
     self.detailLab2.frame = CGRectMake(95, 75, 33.0/320.0*SCREEN_WIDTH, 15.0/568.0*SCREEN_HEIGHT);
    
    self.EnglishLab.frame = CGRectMake(45, 100, 40.0/320.0*SCREEN_WIDTH, 13.0/568.0*SCREEN_HEIGHT);
    self.detailLab3.frame = CGRectMake(95, 100, 33.0/320.0*SCREEN_WIDTH, 15.0/568.0*SCREEN_HEIGHT);
    
    self.TotalLab.frame = CGRectMake(45, 124, 53.0/320.0*SCREEN_WIDTH, 13.0/568.0*SCREEN_HEIGHT);
    self.detailLab4.frame = CGRectMake(95, 124, 33.0/320.0*SCREEN_WIDTH, 15.0/568.0*SCREEN_HEIGHT);
    self.classLab.frame = CGRectMake(130, 124, 73.0/320.0*SCREEN_WIDTH, 15.0/568.0*SCREEN_HEIGHT);
    self.schoolLab.frame = CGRectMake(213, 124, 80.0/320.0*SCREEN_WIDTH, 15.0/568.0*SCREEN_HEIGHT);
    
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
