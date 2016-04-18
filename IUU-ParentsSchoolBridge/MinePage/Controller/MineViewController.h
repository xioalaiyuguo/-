//
//  MineViewController.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/25.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol picDelegate <NSObject>

-(void)fanHuiChuanZhi:(UIImage *)headerImage;


@end



@interface MineViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,picDelegate>

@end
