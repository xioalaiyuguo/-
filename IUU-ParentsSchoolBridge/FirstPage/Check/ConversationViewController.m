//
//  ConversationViewController.m
//  HomeAndSchool-teacher
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 administrator. All rights reserved.
//

#import "ConversationViewController.h"
#import "Define.h"
@interface ConversationViewController ()<RCIMUserInfoDataSource>

@property(strong,nonatomic)UIButton *back;

@end

@implementation ConversationViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden=YES;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self BuildView];
    
    
    [[RCIM sharedRCIM] setUserInfoDataSource:self];
    
}


- (void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    
    self.tabBarController.tabBar.hidden=NO;
    
    
}


- (void)BuildView{
    
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(leftBarButtonItemPressed:) forControlEvents:UIControlEventTouchDown];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;

    
//    UIButton *back=[[UIButton alloc]initWithFrame:CGRectMake(0, 2, 25, 40)];
//    
//    back.contentEdgeInsets=UIEdgeInsetsMake(0, -25, 0, 0);
//    
//    [back setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
//    
//    [back addTarget:self action:@selector(leftBarButtonItemPressed:) forControlEvents:UIControlEventTouchDown];
//    self.back=back;
//    
//    UIBarButtonItem *leftBtn=[[UIBarButtonItem alloc]initWithCustomView:_back];
//    
//    self.navigationItem.leftBarButtonItem=leftBtn;



}

- (void)leftBarButtonItemPressed:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];

//    [super leftBarButtonItemPressed:sender];
//    
//    if (sender==_back) {
//        
//        if (_delegate!=nil&&[_delegate respondsToSelector:@selector(navgationbarHidden)]) {
//            
//            [_delegate navgationbarHidden];
//            
//        }
//        [self.navigationController popViewControllerAnimated:YES];
//        
//    }

}

- (void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion{
    
    
#pragma mark  举例单人聊天
//    if ([@"18790591074" isEqual:userId]) {
//        RCUserInfo *user = [[RCUserInfo alloc]init];
//        user.userId = @"18790591074";
//        user.name = @"盖哥";
//        user.portraitUri = @"http://img4q.duitang.com/uploads/item/201411/18/20141118192934_tyUW8.thumb.224_0.jpeg";
//        return completion(user);
//    }
#pragma mark  举例群组聊天
    if ([@"666" isEqual:userId]) {
        RCUserInfo *user = [[RCUserInfo alloc]init];
        user.userId = @"666";
        user.name = @"信二";
        user.portraitUri = @"http://img4q.duitang.com/uploads/item/201411/18/20141118192934_tyUW8.thumb.224_0.jpeg";
        return completion(user);
    }
    
    return completion(nil);
    
    
    
  

    
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
