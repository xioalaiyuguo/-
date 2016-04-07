//
//  ScoreViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "ScoreViewController.h"
#import "Define.h"
#import "ScoreTableViewCell.h"
#import "CompareViewController.h"
#import "ScoreServiceViewController.h"
#import "FMDB.h"

@interface ScoreViewController ()
@property (strong, nonatomic) FMDatabase *db;
@end

@implementation ScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView animateWithDuration:0.5 animations:^{
        self.navigationController.navigationBarHidden = NO;
    }];
    self.navigationItem.title = @"成绩";
    self.view.backgroundColor = COLOR(248, 248, 248, 1);
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *compareBtn = [[UIButton alloc]initWithFrame:CGRectMake(225.0/320.0*SCREEN_WIDTH, 10.0/568.0*SCREEN_HEIGHT, 80.0/320.0*SCREEN_WIDTH, 35.0/568.0*SCREEN_HEIGHT)];
    [compareBtn setTitle:@"成绩走势" forState:UIControlStateNormal];
    compareBtn.titleLabel.font = FONT(15);
    [compareBtn addTarget:self action:@selector(compare) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:compareBtn];
    self.navigationItem.rightBarButtonItem = rightItem;

    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320.0/320.0*SCREEN_WIDTH, 568.0/568.0*SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self request:_scoreDic];
    [self.view addSubview:self.tableView];
    
//    self.subjectArr = [NSMutableArray arrayWithArray:];
//    self.detailArr1 = [NSMutableArray arrayWithArray:];
//    self.detailArr2 = [NSMutableArray arrayWithArray:];
//    self.detailArr3 = [NSMutableArray arrayWithArray:];
//    self.detailArr4 = [NSMutableArray arrayWithArray:];
    
    // Do any additional setup after loading the view.
}
- (void)request:(NSDictionary *)dic{
    ScoreServiceViewController *score = [[ScoreServiceViewController alloc]init];
    [score requestInfoWithDic:dic andWithSuccessInfo:^(NSDictionary *dic1) {
        if ([dic[@"code"]isEqual:@500]) {
            NSLog(@"查不到此人成绩");
        }else{
            
            self.scoreArr = dic1[@"data"];
            //            NSLog(@"%@",self.scoreArr);
            [self.tableView reloadData];
        }
        
    }];
    
}

- (void)compare{
    
    CompareViewController *compareVC = [[CompareViewController alloc]init];
    
    [self.navigationController pushViewController:compareVC animated:YES];
    
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"cell";
    ScoreTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[ScoreTableViewCell  alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    cell.TimesLab.text = @"第一次月考";
    cell.ChineseLab.text = @"语文：";
    cell.MathLab.text = @"数学：";
    cell.EnglishLab.text = @"英语：";
    cell.TotalLab.text = @"总成绩：";
    
    cell.detailLab1.text = @"115";
    cell.detailLab2.text = @"115";
    cell.detailLab3.text = @"115";
    cell.detailLab4.text = @"345";
    cell.classLab.text = @"班级排名:2";
    cell.schoolLab.text = @"年级排名:100";
//    网上请求的数据
//    cell.TimesLab.text = self.arr[indexPath.row];
//    cell.detailLab1 = self.detailArr1[indexPath.row];
//    cell.detailLab2 = self.detailArr2[indexPath.row];
//    cell.detailLab3 = self.detailArr3[indexPath.row];
//    cell.detailLab4 = self.detailArr4[indexPath.row];
//    cell.classLab.text = self.classA[indexPath.row];
//    cell.schoolLab.text = self.schoolA[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return (SCREEN_HEIGHT-64)/3;
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
