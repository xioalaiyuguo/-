//
//  MineService.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/7.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MineService : NSObject
//-(void)requestInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void(^)(NSDictionary *))homeworkInfo;

-(void)requestInfoWithtjiazhangId:(long int)jiazhangId andWithSuccessInfo:(void(^)(NSDictionary *))studentInfo;
-(void)requestInfoWithtstudentId:(long int)studentId andWithSuccessInfo:(void(^)(NSDictionary *))rongyuInfo;
/**
 *地址
  */
-(void)requestInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void (^)(NSDictionary *))homeworkInfo;
-(void)requestInfoWithjiazhangId:(long)jiazhangId andWithSuccessInfo:(void (^)(NSDictionary *))dizhi;
@end
