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
@interface SetingViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *tabView;
@property (strong,nonatomic)NSArray *infoArr;
@property (strong,nonatomic)UIButton *quitBtn;

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
    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0,8, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.backgroundColor = COLOR(248, 248, 248, 1);
    self.tabView.tableFooterView = [[UIView alloc]init];
    self.tabView.scrollEnabled = NO;
    [self.view addSubview:_tabView];
    self.infoArr = @[@"检查更新",@"关于我们",@"反馈",@"帮助"];
    
    self.quitBtn = [[UIButton alloc]initWithFrame:CGRectMake(5,SCREEN_HEIGHT - 100, SCREEN_WIDTH-10, 44)];
    self.quitBtn.layer.cornerRadius = 3;
    self.quitBtn.backgroundColor = self.navigationController.navigationBar.barTintColor;
    [self.quitBtn setTitle:@"退出登录" forState:UIControlStateNormal];
//    [self.quitBtn addTarget:self action:@selector(quitBtnWay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_quitBtn];
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
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.labName.text = _infoArr[indexPath.row];
    
    cell.textLab.hidden = YES;
    
    return cell;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


@end
