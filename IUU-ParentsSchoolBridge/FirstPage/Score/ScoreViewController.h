//
//  ScoreViewController.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *subjectArr;
@property (strong, nonatomic) NSMutableArray *detailArr1;
@property (strong, nonatomic) NSMutableArray *detailArr2;
@property (strong, nonatomic) NSMutableArray *detailArr3;
@property (strong, nonatomic) NSMutableArray *detailArr4;
@property (strong, nonatomic) NSMutableArray *scoreArr;
@property (strong, nonatomic) NSMutableDictionary *scoreDic;

@end
