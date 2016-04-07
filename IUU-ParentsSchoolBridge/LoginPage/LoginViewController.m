//
//  LoginViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/25.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "LoginViewController.h"
#import "EnterViewController.h"
#import "AppDelegate.h"
#import "Define.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(112, 40, 96.0/320.0*SCREEN_WIDTH, 68.0/568.0*SCREEN_HEIGHT)];
    imageV.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:imageV];
    
    self.numText = [[UITextField alloc]initWithFrame:CGRectMake(30, 188, 260.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT)];
    self.numText.placeholder = @"请输入手机号";
    self.numText.textAlignment = NSTextAlignmentCenter;
    self.numText.font = FONT(12);
    self.numText.clearButtonMode = UITextFieldViewModeWhileEditing;
//    self.numText.textColor = COLOR(193, 193, 193, 1);
    [self.view addSubview:self.numText];
    
    UILabel *lab1 = [[UILabel alloc]initWithFrame:CGRectMake(30, 203, 260.0/320.0*SCREEN_WIDTH, 1.0/568.0*SCREEN_HEIGHT)];
    lab1.backgroundColor = COLOR(193, 193, 193.0/568.0*SCREEN_HEIGHT, 1.0/568.0*SCREEN_HEIGHT);
    [self.view addSubview:lab1];
    
    UILabel *lab2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 268, 260.0/320.0*SCREEN_WIDTH, 1.0/568.0*SCREEN_HEIGHT)];
    lab2.backgroundColor = COLOR(193, 193, 193, 1);
    [self.view addSubview:lab2];
    
    self.inviteText = [[UITextField alloc]initWithFrame:CGRectMake(30, 253, 260.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT)];
    self.inviteText.placeholder = @"请填写邀请码";
    self.inviteText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.inviteText.textAlignment = NSTextAlignmentCenter;
    self.inviteText.font = FONT(12);
//    self.inviteText.textColor = COLOR(193, 193, 193, 1);
    [self.view addSubview:self.inviteText];
    
    
    UIButton *loginBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 445, 300.0/320.0*SCREEN_WIDTH, 42.0/568.0*SCREEN_HEIGHT)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = COLOR(79, 199, 131, 1);
    loginBtn.layer.cornerRadius = 5;
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    // Do any additional setup after loading the view.
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    self.numText.placeholder = nil;
    self.inviteText.placeholder = nil;
    
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.numText resignFirstResponder];
    [self.inviteText resignFirstResponder];
    
    
}
- (void)login{
    EnterViewController *enter = [[EnterViewController alloc]init];
    
    [self presentViewController:enter animated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
