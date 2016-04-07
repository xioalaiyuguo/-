//
//  EnterViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "EnterViewController.h"
#import "FirstViewController.h"
#import "ListChatViewController.h"
#import "LineManViewController.h"
#import "MineViewController.h"
#import "LoginViewController.h"
@interface EnterViewController ()

@end

@implementation EnterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    
    UITabBarController *tbc = [[UITabBarController alloc]init];
    //    自定义底部导航栏字体颜色
    UIColor *titleColor = [UIColor colorWithRed:79.0/255.0 green:199/255.0 blue:131/255.0 alpha:1.0];
    [[UITabBarItem appearance]setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:titleColor,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    //    设置导航栏颜色
    bar.barTintColor = [UIColor colorWithRed:79.0/255.0 green:199/255.0 blue:131/255.0 alpha:1.0];
    //    字体颜色
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    FirstViewController *fvc = [[FirstViewController alloc]init];
    UINavigationController *nvc1 = [[UINavigationController alloc]initWithRootViewController:fvc];
    nvc1.tabBarItem.title = @"首页";
    nvc1.tabBarItem.image = [UIImage imageNamed:@"homePic"];
    nvc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"homePic"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    ListChatViewController *cvc = [[ListChatViewController alloc]init];
    UINavigationController *nvc2 = [[UINavigationController alloc]initWithRootViewController:cvc];
    nvc2.tabBarItem.title = @"消息";
    nvc2.tabBarItem.image = [UIImage imageNamed:@"chatPic"];
    nvc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"chatPic"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    LineManViewController *lmvc = [[LineManViewController alloc]init];
    UINavigationController *nvc3 = [[UINavigationController alloc]initWithRootViewController:lmvc];
    nvc3.tabBarItem.title = @"联系人";
    nvc3.tabBarItem.image = [UIImage imageNamed:@"friendPic"];
    nvc3.tabBarItem.selectedImage = [[UIImage imageNamed:@"friendPic"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MineViewController *mvc = [[MineViewController alloc]init];
    UINavigationController *nvc4 = [[UINavigationController alloc]initWithRootViewController:mvc];
    nvc4.tabBarItem.title = @"我的";
    nvc4.tabBarItem.image = [UIImage imageNamed:@"mePic"];
    nvc4.tabBarItem.selectedImage = [[UIImage imageNamed:@"mePic"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    tbc.viewControllers = @[nvc1,nvc2,nvc3,nvc4];
    //    [tbc addChildViewController:nvc1];
    //    [tbc addChildViewController:nvc2];
    //    [tbc addChildViewController:nvc3];
    //    [tbc addChildViewController:nvc4];
    
    self.window.rootViewController = tbc;
    
    [self.window makeKeyAndVisible];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
