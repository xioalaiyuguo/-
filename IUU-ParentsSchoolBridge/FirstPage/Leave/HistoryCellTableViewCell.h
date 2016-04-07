//
//  HistoryCellTableViewCell.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/1.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HistoryCellTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *starTime;
@property (strong, nonatomic) UILabel *endTime;
@property (strong, nonatomic) UILabel *because;
@property (strong, nonatomic) UILabel *code;

@property (strong, nonatomic) UILabel *starLabel;
@property (strong, nonatomic) UILabel *endLabel;
@property (strong, nonatomic) UILabel *becauseLabel;
@property (strong, nonatomic) UILabel *codeLabel;

@property (strong, nonatomic) UIView *view1;

@end
