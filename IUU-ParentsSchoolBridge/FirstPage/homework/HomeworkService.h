//
//  HomeworkService.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeworkService : NSObject

-(void)requestInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void(^)(NSDictionary *))homeworkInfo;

-(void)requestInfoWithteacherId:( long int)teacherId andWithSuccessInfo:(void(^)(NSDictionary *))teacherInfo;

-(NSString *)plistPath;
- (void )selectImage:(int)homeworkId andWithSuccessInfo:(void (^)(NSArray *))imageInfo;

//-(void)requestTeacherImageWith:(int)teacher andWithSuccess:(void (^)(NSData *))teacherImage;
-(void)requestsubInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void (^)(NSDictionary *))homeworkInfo;

@end
