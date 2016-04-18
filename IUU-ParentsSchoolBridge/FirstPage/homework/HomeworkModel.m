//
//  homeworkModel.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HomeworkModel.h"

@implementation HomeworkModel

+(instancetype)HomeworkModelWithdic:(NSDictionary *)dic{
    HomeworkModel *hm = [[self alloc]init];
    hm.subject = dic[@"homework_subject"];
    hm.homeworkimage = dic[@"homework_image"];
    hm.teacherid = dic[@"teachers_id"];
    hm.time = dic[@"homework_time"];
    
    hm.homeworkId = dic[@"homework_id"];
    
    hm.teacherName = dic[@"user_name"];
    NSString *contentString = dic[@"homework_content"];
    
    NSArray* stringArray = [contentString componentsSeparatedByString: @"#"];
    
    hm.countHw = stringArray.count - 1;
    
    NSString* dayString = [stringArray objectAtIndex: 0];
    hm.homeworkcontent1 = dayString;
    if (stringArray.count == 2) {
        hm.homeworkcontent22 = [stringArray objectAtIndex: 1];
        hm.homeworkcontent2 = [stringArray objectAtIndex: 1];
    }
    
    if (stringArray.count >2) {
        hm.homeworkcontent2 = [stringArray objectAtIndex: 1];
        hm.homeworkcontent22 = [NSString stringWithFormat:@"%@............",hm.homeworkcontent2];
    }
    
    if (stringArray.count == 3) {
       hm.homeworkcontent3 = [stringArray objectAtIndex: 2];
    }
    if (stringArray.count == 4) {
        hm.homeworkcontent2 = [stringArray objectAtIndex: 1];
        hm.homeworkcontent3 = [stringArray objectAtIndex: 2];
        hm.homeworkcontent4 = [stringArray objectAtIndex: 3];

    }
    if (stringArray.count > 4) {
        hm.homeworkcontent2 = [stringArray objectAtIndex: 1];
        hm.homeworkcontent3 = [stringArray objectAtIndex: 2];
        hm.homeworkcontent4 = [stringArray objectAtIndex: 3];
        
    }
    return hm;
}

@end
