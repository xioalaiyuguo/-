//
//  fabkuiViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/14.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "fabkuiViewController.h"
#import "Define.h"
#import "UIPlaceholderTextView.h"
#import "SVProgressHUD.h"
@interface fabkuiViewController ()<UITextViewDelegate>
@property (strong,nonatomic)UIPlaceholderTextView *textVi;

//**文字*/
@property (copy,nonatomic)NSString  *jianyi;

//**提交*/
@property (strong,nonatomic)UIButton *tijiao;
@end

@implementation fabkuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR(248, 248, 248, 1.0);
    self.navigationItem.title = @"反馈";
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,24,12)];
    [rightBtn setTitle:@"完成" forState:UIControlStateNormal];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [rightBtn addTarget:self action:@selector(rightButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;

    
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.textVi = [[UIPlaceholderTextView alloc]initWithFrame:CGRectMake(0,74, SCREEN_WIDTH, 150)];
//    self.textVi.frame = CGRectMake(0, 64, SCREEN_WIDTH, 250);
    self.textVi.backgroundColor = [UIColor whiteColor];
    self.textVi.delegate = self;
    self.textVi.layer.borderWidth = 1.0;
    self.textVi.layer.borderColor = COLOR(200, 200, 200, 1.0).CGColor;
    
    self.textVi.keyboardType = UIKeyboardTypeDefault;//键盘类型
    
    self.textVi.textAlignment = NSTextAlignmentLeft; //文本显示的位置默认为居左
    
    self.textVi.dataDetectorTypes = UIDataDetectorTypeAll; //显示数据类型的连接模式（如电话号码、网址、地址等）
    
    self.textVi.textColor = [UIColor blackColor];
    
//    self.textVi.text = @"UITextView详解";//设置显示的文本内容
    self.textVi.placeholder = @"点击输入";
    [self.view addSubview:_textVi];
    
    self.tijiao = [[UIButton alloc]initWithFrame:CGRectMake(10, 244, SCREEN_WIDTH-20, 44)];
    [self.tijiao setTitle:@"提交" forState:UIControlStateNormal];
    self.tijiao.layer.cornerRadius = 3;
    self.tijiao.backgroundColor = self.navigationController.navigationBar.barTintColor;
    [self.tijiao setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.tijiao addTarget:self action:@selector(recevieJianYi) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_tijiao];
    
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location>=100)
    {
        //控制输入文本的长
        return  NO;
    }
    if ([text isEqualToString:@"\n"]) {
        //禁止输入换行
        return NO;
    }
    else
    {
        return YES;
    }
    
}


-(void)leftButton{
    [self.navigationController popViewControllerAnimated:YES];
    
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.view endEditing:YES];
//}

-(void)rightButton{
   
    [self.view endEditing:YES];
    if ([self.textVi.text isEqualToString:@""]) {
       self.textVi.placeholder = @"点击输入";
    }else{
//         self.jianyi =  self.textVi.text;
    }
    
}

-(void)recevieJianYi{
    self.jianyi =  self.textVi.text;
    if ([self.jianyi isEqualToString:@""]||[self.jianyi isEqualToString:@"点击输入"]) {
//        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
//        [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
        [SVProgressHUD showErrorWithStatus:@"请输入您的宝贵意见哦"];
//        [SVProgressHUD dismissWithDelay:1.5];
    }else{
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
//        [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
        [SVProgressHUD showSuccessWithStatus:@"提交成功"];
//        [SVProgressHUD dismissWithDelay:1.5];
    }
    
}

@end
