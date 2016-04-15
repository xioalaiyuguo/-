//
//  SetingViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "SetingViewController.h"
#import "Define.h"
#import "MineSecondTableViewCell.h"

#import "jianchaViewController.h"
#import "guanyuwomenViewController.h"
#import "fabkuiViewController.h"
#import "helpViewController.h"


#import "SVProgressHUD.h"
#import "MBProgressHUD.h"

#import "LoginViewController.h"
@interface SetingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tabView;
@property (strong,nonatomic)NSArray *infoArr;
@property (strong,nonatomic)UIButton *quitBtn;


//**提示框*/
@property (assign,nonatomic) long int i;

//**提示框数据*/
@property (strong,nonatomic)NSArray *arrAlert;

@end

@implementation SetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.view.backgroundColor = COLOR(248, 248, 248, 1);
    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0,8, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.backgroundColor = COLOR(248, 248, 248, 1);
    self.tabView.tableFooterView = [[UIView alloc]init];
    self.tabView.scrollEnabled = NO;
    [self.view addSubview:_tabView];
    self.infoArr = @[@"检查更新",@"关于我们",@"反馈",@"帮助",@"清空消息列表",@"清空所有聊天记录",@"清空缓存数据"];
    
    self.quitBtn = [[UIButton alloc]initWithFrame:CGRectMake(5,SCREEN_HEIGHT - 100, SCREEN_WIDTH-10, 44)];
    self.quitBtn.layer.cornerRadius = 3;
    self.quitBtn.backgroundColor = self.navigationController.navigationBar.barTintColor;
    [self.quitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [self.quitBtn addTarget:self action:@selector(quitBtnWay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_quitBtn];
    
    self.arrAlert = @[ @[@"清空消息列表后，聊天记录依然保留，确定要清空消息列表？",@"清空消息列表"],@[@"确定要清空本地所有的聊天纪录",@"清空所有聊天纪录"],@[@"确定清空本地缓存数据？",@"清空缓存数据"]];
    
    
}
-(void)leftButton{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *Id = @"12345";
    MineSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (cell == nil) {
        cell = [[MineSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
           }
    if (indexPath.section == 0) {
        cell.labName.text = _infoArr[indexPath.row];
        cell.text2.hidden = YES;
        cell.textLab.hidden = YES;
        cell.text1.hidden = YES;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }else{
        
        cell.labName.text = _infoArr[indexPath.row+4];
        cell.labName.textColor = self.navigationController.navigationBar.barTintColor;
        cell.text2.hidden = YES;
        cell.textLab.hidden = YES;
        cell.text1.hidden = YES;
    }
    
    return cell;
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ( section == 0   ) {
        return 4;
    }else{
    return 3;
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"";
    }else{
        return @"你可以选择清除本地信息";
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }else{
        return 20;
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
     [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            jianchaViewController *jj = [[jianchaViewController alloc]init];
            [self.navigationController pushViewController:jj animated:YES];
            
        }else if (indexPath.row == 1) {
            guanyuwomenViewController *gg = [[guanyuwomenViewController alloc]init];
            [self.navigationController pushViewController:gg animated:YES];
        }else if (indexPath.row == 2) {
            fabkuiViewController *ff = [[fabkuiViewController alloc]init];
            [self.navigationController pushViewController:ff animated:YES];
        }else{
            helpViewController *hh = [[helpViewController alloc]init];
            [self.navigationController pushViewController:hh animated:YES];
        }
    }else{
        
        self.i  = indexPath.row;
        [self showAlertControll];
        
}
    

}


-(void)showAlertControll{
    UIAlertController *alerc = [UIAlertController alertControllerWithTitle:_arrAlert[_i][0] message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:_arrAlert[_i][1] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (self.i == 0) {
            
        }else if(self.i == 1){
            
        }else{
            [self clearBendiInfo];

        }
      
        
        
    }];
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
       
        
    }];
    [alerc addAction:act1];
    [alerc addAction:act2];
    [self presentViewController:alerc animated:YES completion:nil];

}

#pragma 清除本地数据

-(void)clearBendiInfo{

    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self performSelector:@selector(hiden) withObject:nil afterDelay:3.0];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)objectAtIndex:0];
        
        NSArray *files = [[NSFileManager defaultManager]subpathsAtPath:cachPath];
        
        NSLog(@"files %@",files);
        NSLog(@"files:%lu",(unsigned long)[files count]);
        
        for (NSString *p in files) {
            
            NSError *error;
            
            NSString *path = [cachPath stringByAppendingPathComponent:p];
            
            NSLog(@"路径打印%@",path);
            if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
                
                [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
                
            }
        }
        
        [self performSelectorOnMainThread:@selector(clearCash) withObject:nil waitUntilDone:YES];
    });
    
 
}

- (void)clearFile{
    
    NSString *cash = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)firstObject];
    
    NSArray *files = [[NSFileManager defaultManager]subpathsAtPath:cash];
    
    NSLog(@"cash = %@",cash);
    
    for (NSString *p in files) {
        NSError *error;
        
        NSString *path = [cash stringByAppendingPathComponent:p];
        
        if ([[NSFileManager defaultManager]fileExistsAtPath:path]) {
            [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
        }
    }
    [self performSelectorOnMainThread:@selector(clearCash) withObject:nil waitUntilDone:YES];
}

- (void)clearCash{
    
    NSLog(@"清理成功");
    
}

-(void)hiden{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
//  [SVProgressHUD setBackgroundColor:[UIColor blackColor]];
    [SVProgressHUD showSuccessWithStatus:@"删除成功"];
//    [SVProgressHUD dismissWithDelay:1.5];
//  [SVProgressHUD setMinimumDismissTimeInterval:10.0];

}

-(void)quitBtnWay{
    LoginViewController *ff = [[LoginViewController alloc]init];
    [self presentViewController:ff animated:YES completion:nil];
}

@end
