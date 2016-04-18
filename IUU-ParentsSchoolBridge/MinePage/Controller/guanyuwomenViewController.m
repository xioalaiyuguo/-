//
//  guanyuwomenViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/14.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "guanyuwomenViewController.h"
#import "Define.h"

@interface guanyuwomenViewController ()

@end

@implementation guanyuwomenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navgation];
    [self creatKongjian];
}

-(void)creatKongjian{
    
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(15, 129, 70, 25)];
    lab1.text = @"制作团队:";
    lab1.font = [UIFont systemFontOfSize:15];
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(95, 65+64, 100, 25)];
    lab2.font = [UIFont systemFontOfSize:15];
    lab2.text = @"李,王";
    
    UILabel *lab3 = [[UILabel alloc]initWithFrame:CGRectMake(95, 90+64, 100, 25)];
    lab3.font = [UIFont systemFontOfSize:15];
    lab3.text = @"王,郭";
    
    [self.view addSubview:lab1];
    [self.view addSubview:lab2];
    [self.view addSubview:lab3];
    
    UILabel *lab4 = [[UILabel alloc]initWithFrame:CGRectMake(15, 216+64,SCREEN_WIDTH-30, 25)];
    lab4.font = [UIFont systemFontOfSize:15];
    lab4.text = @"联系邮箱:";
    
    [self.view addSubview:lab4];
    
    UILabel *lab5 = [[UILabel alloc]initWithFrame:CGRectMake(95, 216+64, SCREEN_WIDTH-30, 25)];
    lab5.font = [UIFont systemFontOfSize:15];
    lab5.text = @"Homelinkschool@163.com";
    
    [self.view addSubview:lab5];
    
    
    
}

-(void)navgation{
    
    self.navigationItem.title = @"关于我们";
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.view.backgroundColor =COLOR(248, 248, 248, 1);
    
    
}

#pragma mark - 左侧按钮
-(void)leftButton{
    [self.navigationController popViewControllerAnimated:YES];
    
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
