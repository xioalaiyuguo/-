//
//  homeworkViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HomeworkViewController.h"
#import "HomeworkTableViewCell.h"
#import "Define.h"
#import "HomeworkTableViewCell.h"
#import "HomeworkModel.h"
#import "HomeworkService.h"
#import "WeekDaysView.h"
#import "NSString+new.h"
#import "OneHomeworkViewController.h"

@interface HomeworkViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (strong,nonatomic)NSDictionary *dic;
@property (strong,nonatomic)NSMutableDictionary *requestDic;

@property (strong,nonatomic)NSArray *homeworkArr;
@property (strong,nonatomic)NSArray *getArr;
@property (assign,nonatomic)int i;

@property (assign,nonatomic)BOOL viewHidden;

@property (strong,nonatomic)UIView *vvv;
@property (strong,nonatomic)UIView *headerView;
@property (strong,nonatomic)UIActivityIndicatorView *refreshView;
@property (strong,nonatomic)UILabel *headLab;

/**
 *  获取当天2016-03-30的字符串
 */
@property (assign,nonatomic)NSString *day;

/**
 *  存放显示周几的可遍数组
 */
@property (strong,nonatomic)NSMutableArray *weekArr;

@property (strong,nonatomic)UILabel *lab;

//请求科目
@property (strong,nonatomic)NSMutableDictionary *subDic;

@end

@implementation HomeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewHidden = YES;
    self.i = 0;
   
    self.lab = [[UILabel alloc]init];
    _lab.text = @"今天没有发布作业哦";
    _lab.font = [UIFont systemFontOfSize:15];
    _lab.textColor = COLOR(150, 150, 150, 1);
    _lab.frame = CGRectMake(SCREEN_WIDTH/2-75,(SCREEN_HEIGHT-64)/2, 150, 15);
    _lab.hidden = YES;
       self.navigationController.navigationBarHidden = NO;
  
    NSString *week = [NSString getWeek];
    self.weekArr = [[NSMutableArray alloc]init];
    self.weekArr = [NSString weekDays:week];
//    NSLog(@"%@",_weekArr);
    self.navigationItem.title = _weekArr[0];
    
    UIButton *btn = [[UIButton alloc]init];
    [btn setBackgroundImage:[UIImage imageNamed:@"homework_lookmore"] forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 0,32,32);
    [btn addTarget:self action:@selector(lookMore) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = rightBtn;
    
    self.headLab = [[UILabel alloc]init];
    self.headLab.frame = CGRectMake(0, 30, SCREEN_WIDTH,12);
    self.headLab.font = [UIFont systemFontOfSize:10];
    self.headLab.textAlignment = NSTextAlignmentCenter;
    self.headLab.text = @"下拉刷新";
    self.refreshView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.refreshView.center = CGPointMake(SCREEN_WIDTH/2,18.0);
    
    self.view.backgroundColor = COLOR(248, 248, 248, 1);
    self.headerView = [[UIView alloc]init];
    self.headerView.frame = CGRectMake(0, 0,SCREEN_WIDTH, 45);
    self.headerView.backgroundColor = [UIColor clearColor];
    [self.headerView addSubview:_headLab];
    [self.headerView addSubview:_refreshView];

    self.homeworkTabView = [[UITableView alloc]initWithFrame:CGRectMake(0,-45, SCREEN_WIDTH, SCREEN_HEIGHT+45) style:UITableViewStylePlain];
    self.homeworkTabView.backgroundColor = COLOR(248, 248, 248, 1);
    self.homeworkTabView.delegate = self;
    self.homeworkTabView.dataSource = self;
    self.homeworkTabView.tableHeaderView = _headerView;
    self.homeworkTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.homeworkTabView.showsVerticalScrollIndicator = NO;
    
    [self.refreshView  startAnimating];
    self.headLab.hidden = YES;
    self.homeworkTabView.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
    

    [self.view addSubview:_homeworkTabView];
    
    self.day = [NSString getDay];
    NSLog(@"%@",_day);
    
//    self.requestDic = [NSMutableDictionary dictionaryWithCapacity:0];
//    [self.requestDic setObject:_day forKey: @"time"];
//    [self.requestDic setObject:@1 forKey: @"classId"];
    [self newRequest];
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadTable:) name:@"reloadTableview" object:nil];
    
    self.vvv = [[WeekDaysView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT)andWithWeek:_weekArr];
    self.vvv.hidden = YES;
    [self.view addSubview:_lab];

    [self.view addSubview:_vvv];
    
}

- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(NSArray *)homeworkArr{
    if (_homeworkArr==nil) {
        NSArray *dicArr = _getArr;
        NSMutableArray *arr = [NSMutableArray arrayWithCapacity:0];
//        for (NSDictionary *dic in dicArr) {
//            HomeworkModel *hm = [HomeworkModel HomeworkModelWithdic:dic];
//            [arr addObject:hm];
//        }
//        _homeworkArr = arr;
        long  int t ;
        for ( t = dicArr.count - 1; t>=0; t--) {
            NSDictionary *dic = dicArr[t];
            HomeworkModel *hm = [HomeworkModel HomeworkModelWithdic:dic];
            [arr addObject:hm];
            NSLog(@"11111%ld",t);
        }
        _homeworkArr = arr;

        
    }
    
    return _homeworkArr;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *idCell = @"hw";
    HomeworkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idCell];
    if (cell == nil) {
        cell = [[HomeworkTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idCell];
    }
    cell.backgroundColor = COLOR(248, 248, 248, 1);
    
    HomeworkModel *h1 = self.homeworkArr[indexPath.row];
    if ([h1.subject isEqualToString:@"语文"]) {
        cell.bgImageView.image = [UIImage imageNamed:@"chinese_work"];
    }
    if ([h1.subject isEqualToString:@"数学"]) {
        cell.bgImageView.image = [UIImage imageNamed:@"math_work"];
    }
    if ([h1.subject isEqualToString:@"英语"]) {
        cell.bgImageView.image = [UIImage imageNamed:@"english_work"];
    }

    cell.lab1.text = h1.homeworkcontent1;
    cell.lab2.text = h1.homeworkcontent22;
    cell.timaeLab.text = h1.time;
    
    /**
     *  daigai
     */
    cell.teacherNameLab.text = h1.teacherName;
//    cell.teacherNameLab.text = h1.teacherName;
    return  cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.getArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 168.0/568.0*SCREEN_HEIGHT;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
     HomeworkModel *h1 = self.homeworkArr[indexPath.row];
    OneHomeworkViewController *ooo = [[OneHomeworkViewController alloc]init];
    ooo.hw = h1;
    [self.navigationController pushViewController:ooo animated:YES];
}

#pragma mark 点击右上角按钮执行的方法
-(void)lookMore{
    self.vvv.hidden = !(self.vvv.hidden);
}

#pragma mark 点击右上角的周几执行的方法
-(void)reloadTable:(NSNotification *)notification{
    _lab.hidden = YES;
    NSString *str = notification.object;
    
    NSArray* stringArray = [str componentsSeparatedByString: @"+"];
    NSString *str2 = stringArray[1];
    NSString *str1 = stringArray[0];
    
    self.i = str1.intValue;
    NSLog(@"%d",_i);
//    self.homeworkArr = nil;

       if (_i > 800) {
           self.homeworkArr = nil;
           if ([str2 isEqualToString:@"1000"]) {
               self.navigationItem.title = @"语文作业";
                             NSDictionary *dic = @{@"sub":@"语文",
                                     @"classId":@1,
                                     };
               self.subDic = [NSMutableDictionary dictionaryWithDictionary:dic];
                         }
           if ([str2 isEqualToString:@"1001"]) {
               self.navigationItem.title = @"数学作业";
               NSDictionary *dic = @{@"sub":@"数学",
                                     @"classId":@1,
                                     };
               self.subDic = [NSMutableDictionary dictionaryWithDictionary:dic];
               NSLog(@"shuxue");
               NSLog(@"%@",_subDic[@"sub"]);
                        }
           if ([str2 isEqualToString:@"1002"]) {
               self.navigationItem.title = @"英语作业";
               NSDictionary *dic = @{@"sub":@"英语",
                                     @"classId":@1,
                                     };
               self.subDic = [NSMutableDictionary dictionaryWithDictionary:dic];

                          }
           [self subRequest:_subDic];

           
    }else{
   
    self.navigationItem.title = _weekArr[str2.intValue];
        [self newRequest];
    }
  
    [self.refreshView  startAnimating];
    self.headLab.hidden = YES;
    self.homeworkTabView.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
   }

-(void)newRequest{
    

    NSString *today = [NSString getDay];
    
    NSString *day = [NSString stringWithString:today andWithtt:_i];
//    NSString *day = @"2016-04-09";
    self.requestDic = [NSMutableDictionary dictionaryWithCapacity:0];
    [self.requestDic setObject:day forKey: @"time"];
    [self.requestDic setObject:@1 forKey: @"classId"];
    [self request:_requestDic];
    self.homeworkArr = nil;

}

#pragma mark 请求数据的方法
-(void)request:(NSDictionary *)dic{
    HomeworkService *ss = [[HomeworkService alloc]init];
    [ss requestInfoWithDic:dic andWithSuccessInfo:^(NSDictionary *homeworkDic) {
        NSLog(@"%@",homeworkDic[@"code"]);
        if ([homeworkDic[@"code"] isEqual:@0]) {
            self.getArr = nil;
            NSLog(@"今天没有发布作业哦");
            [self performSelector:@selector(showLab) withObject:nil afterDelay:1.0f];
          
        }else{
        
        self.getArr = homeworkDic[@"data"];
          
        //        NSLog(@"%@",_getArr);
            if (!_lab.hidden) {
                _lab.hidden = YES;
            }
        
        
        }
        if (self.refreshView.isAnimating == YES) {
            [self performSelector:@selector(sstop) withObject:nil afterDelay:1.0f];
           
        }
         [self.homeworkTabView reloadData];
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.vvv setHidden:YES];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   float ff =  self.homeworkTabView.contentOffset.y;
    if (ff < -99.0) {
//        NSLog(@"******%f",ff);
        self.headLab.text = @"松开刷新";
        if (!_lab.hidden) {
            _lab.hidden = YES;
        }
             }
}


-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if ([self.headLab.text isEqualToString:@"松开刷新"]) {
        [self.refreshView  startAnimating];
        self.homeworkTabView.frame = CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.headLab.hidden = YES;
        if (_i > 800) {
            [self subRequest:_subDic]; 
        }else{
        [self newRequest];
        }
    }
    
}

-(void)sstop{
    [self.refreshView stopAnimating];
    self.headLab.text = @"下拉刷新";
    self.headLab.hidden = NO;
    self.homeworkTabView.frame = CGRectMake(0,-45, SCREEN_WIDTH, SCREEN_HEIGHT+45);
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
-(void)showLab{
    if (_i > 800) {
        _lab.text = @"暂无历史作业";
    }else{
        _lab.text = @"今天 没有发布作业哦";
    }
    _lab.hidden = NO;
   
}

//科目作业的请求
-(void)subRequest:(NSDictionary *)dic{
    HomeworkService *ss = [[HomeworkService alloc]init];
    [ss requestsubInfoWithDic:dic andWithSuccessInfo:^(NSDictionary *homeworkDic) {
        if ([homeworkDic[@"code"] isEqual:@0]) {
            self.getArr = nil;
            NSLog(@"没有发布作业哦");
            [self performSelector:@selector(showLab) withObject:nil afterDelay:1.0f];
            
        }else{
            
            
            self.getArr = homeworkDic[@"data"];
            //                       self.homeworkArr = _getArr;
            NSLog(@"%@",_getArr);
            if (!_lab.hidden) {
                _lab.hidden = YES;
            }
            
            
        }
        if (self.refreshView.isAnimating == YES) {
            [self performSelector:@selector(sstop) withObject:nil afterDelay:1.0f];
            
        }
        [self.homeworkTabView reloadData];
    }];
    

}
@end
