//
//  MineSecondTableViewCell.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineSecondTableViewCell : UITableViewCell<UITextFieldDelegate>
@property (strong,nonatomic)UILabel *labName;
@property (strong,nonatomic)UILabel *textLab;
@property (strong,nonatomic)UITextField *text1;
@property (strong,nonatomic)UITextView *text2;


@end
