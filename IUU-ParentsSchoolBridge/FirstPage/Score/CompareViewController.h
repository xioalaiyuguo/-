//
//  CompareViewController.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompareViewController : UIViewController<UIScrollViewDelegate>
@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) NSArray *subjectArr;
@end
