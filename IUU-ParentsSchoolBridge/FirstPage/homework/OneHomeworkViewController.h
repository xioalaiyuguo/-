//
//  OneHomeworkViewController.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeworkModel.h"
@interface OneHomeworkViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)HomeworkModel *hw;
@end
