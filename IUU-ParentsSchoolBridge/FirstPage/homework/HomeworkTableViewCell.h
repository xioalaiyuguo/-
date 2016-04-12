//
//  homeworkTableViewCell.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeworkTableViewCell : UITableViewCell

@property (strong,nonatomic)UIView *cellView;

@property (strong,nonatomic)UIImageView *bgImageView;

@property (strong,nonatomic)UIImageView *subImageView;

@property (strong,nonatomic)UILabel *lab1;

@property (strong,nonatomic)UILabel *lab2;

//时间
@property (strong,nonatomic)UILabel *timaeLab;

//老师姓名的
@property (strong,nonatomic)UILabel *teacherNameLab;

@end
