//
//  jianchaViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/14.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "jianchaViewController.h"
#import "Define.h"
#import "AFNetworking.h"
@interface jianchaViewController ()

/** 当前版本号 */
@property (copy,nonatomic)NSString *currentVersion;

/**  最新版本号 */
@property (copy,nonatomic)NSString *lastVersion;
@end

@implementation jianchaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navgation];
    
}

-(void)jiachaUpdata{
    //1.当前版本号
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = [infoDic objectForKey:@"CFBundleVersion"];
    self.currentVersion = currentVersion;
    
    //2.获取最新版本号
    
#warning 获取应用ID
    NSString *URL = @"http://itunes.apple.com/lookup";
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[@"id"]=@"你的应用程序的ID";
    
    [[AFHTTPSessionManager manager] POST:URL parameters:dic constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSArray *result = responseObject[@"results"];
        
        NSDictionary *infoDic = result[0];
        
        //最新版本信息号
        NSString *lastVersion = infoDic[@"version"];
        self.lastVersion =lastVersion;
        [self bijiao];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
}

-(void)bijiao{
    if ([self.currentVersion isEqualToString:self.lastVersion]) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更新" message:@"当前为最新版本" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else{
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"更新" message:@"有新的版本更新，是否前往更新？" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSURL *url = [NSURL URLWithString:@"https://itunes.apple.com"];
            
            [[UIApplication sharedApplication]openURL:url];
            
        }];
        [alert addAction:action];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
    
    
}


-(void)navgation{
    
    self.navigationItem.title = @"检查更新";
    
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

@end
