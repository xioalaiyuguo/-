//
//  PhoneViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "PhoneViewController.h"
#import "Define.h"
@interface PhoneViewController ()

@end

@implementation PhoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //    (10, 11, 50.0/320.0*SCREEN_WIDTH, 50.0/568.0*SCREEN_HEIGHT)
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15.0/320.0*SCREEN_WIDTH, 10.0/568.0*SCREEN_HEIGHT, 10.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;

    // Do any additional setup after loading the view.
}
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
