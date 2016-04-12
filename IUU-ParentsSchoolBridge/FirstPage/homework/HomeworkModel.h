//
//  homeworkModel.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeworkModel : NSObject
@property (copy,nonatomic)NSString *subject;
@property (copy,nonatomic)NSString *homeworkimage;
@property (copy,nonatomic)NSString *homeworkcontent1;
@property (copy,nonatomic)NSString *homeworkcontent2;
@property (copy,nonatomic)NSString *homeworkcontent22;
@property (copy,nonatomic)NSString *homeworkcontent3;
@property (copy,nonatomic)NSString *homeworkcontent4;
@property (copy,nonatomic)NSString *teacherid;
@property (copy,nonatomic)NSString *time;
@property (assign,nonatomic)long  int countHw;

@property (copy,nonatomic)NSString *homeworkId;

@property (assign, nonatomic) CGFloat cellHeight;

//老师的名字
@property (copy,nonatomic)NSString *teacherName;

+(instancetype)HomeworkModelWithdic:(NSDictionary *)dic;

@end
