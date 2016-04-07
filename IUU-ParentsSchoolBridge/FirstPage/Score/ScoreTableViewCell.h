//
//  ScoreTableViewCell.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreTableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView *backImageView;
@property (strong, nonatomic) UILabel *TimesLab;
@property (strong, nonatomic) UILabel *ChineseLab;
@property (strong, nonatomic) UILabel *MathLab;
@property (strong, nonatomic) UILabel *EnglishLab;
@property (strong, nonatomic) UILabel *TotalLab;
@property (strong, nonatomic) UILabel *detailLab1;
@property (strong, nonatomic) UILabel *detailLab2;
@property (strong, nonatomic) UILabel *detailLab3;
@property (strong, nonatomic) UILabel *detailLab4;
@property (strong, nonatomic) UILabel *classLab;
@property (strong, nonatomic) UILabel *schoolLab;
@end
