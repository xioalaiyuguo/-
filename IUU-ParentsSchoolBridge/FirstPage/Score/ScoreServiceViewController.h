//
//  ScoreServiceViewController.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"
@interface ScoreServiceViewController : UIViewController
@property (strong, nonatomic)FMDatabase *db;
-(void)requestInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void(^)(NSDictionary *dic1))scoreInfo;
- (NSString *)sqlitePath;




@end
