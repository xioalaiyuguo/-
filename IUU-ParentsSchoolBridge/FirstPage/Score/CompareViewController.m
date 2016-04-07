//
//  CompareViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "CompareViewController.h"
#import "Define.h"
#import "PNChart.h"
@interface CompareViewController ()
@property (strong, nonatomic) PNLineChart *line1;
@property (strong, nonatomic) PNLineChart *line2;
@property (strong, nonatomic) PNLineChart *line3;
@property (strong, nonatomic) PNLineChart *line4;
@property(strong,nonatomic)PNPieChart *pie;
@end

@implementation CompareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"成绩走势";
    self.view.backgroundColor   =  [UIColor whiteColor];
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10.0/320.0*SCREEN_WIDTH, 20.0/568.0*SCREEN_HEIGHT)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,150.0/568.0*SCREEN_HEIGHT, 320.0/320.0*SCREEN_WIDTH, 300.0/568.0*SCREEN_HEIGHT)];
    self.scrollView.contentSize = CGSizeMake(320.0/320.0*SCREEN_WIDTH*4,  0);
    
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.subjectArr = @[@"语文",@"数学",@"英语",@"总成绩"];
    
    
//    折线图
    
//    for (int i = 0; i< self.subjectArr.count; i++) {
    
        self.line1 = [[PNLineChart alloc]initWithFrame:CGRectMake(0,-60, 320.0/320.0*SCREEN_WIDTH, 200.0/568.0*SCREEN_HEIGHT)];
//    x坐标
//    网络请求的数据
        [self.line1 setXLabels:@[@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1"]];
        
//   Line Chart No.1

//   y数据
        
        NSArray * data01Array = @[@60.1, @160.1, @126.4, @262.2, @186.2,@60.1, @160.1, @126.4, @262.2, @186.2];
        PNLineChartData *data01 = [PNLineChartData new];
        data01.color = PNFreshGreen;
        data01.itemCount = self.line1.xLabels.count;
        data01.getData = ^(NSUInteger index) {
            CGFloat yValue = [data01Array[index] floatValue];
            return [PNLineChartDataItem dataItemWithY:yValue];
            
        };
        
    self.line1.chartData = @[data01];
    [self.line1 strokeChart];
    
    
    self.line2 = [[PNLineChart alloc]initWithFrame:CGRectMake(320.0/320.0*SCREEN_WIDTH,-60, 320.0/320.0*SCREEN_WIDTH, 200.0/568.0*SCREEN_HEIGHT)];
    //    x坐标
    //    网络请求的数据
    [self.line2 setXLabels:@[@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1"]];
    
    //   Line Chart No.1
    
    //   y数据
    
    NSArray * data02Array = @[@60.1, @160.1, @126.4, @262.2, @186.2,@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.color = PNFreshGreen;
    data02.itemCount = self.line2.xLabels.count;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
        
    };
    
    self.line2.chartData = @[data02];
    [self.line2 strokeChart];
    
    
    
    
    self.line3 = [[PNLineChart alloc]initWithFrame:CGRectMake(2*320.0/320.0*SCREEN_WIDTH,-60, 320.0/320.0*SCREEN_WIDTH, 200.0/568.0*SCREEN_HEIGHT)];
    //    x坐标
    //    网络请求的数据
    [self.line3 setXLabels:@[@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1"]];
    
    //   Line Chart No.1
    
    //   y数据
    
    NSArray * data03Array = @[@60.1, @160.1, @126.4, @262.2, @186.2,@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data03 = [PNLineChartData new];
    data03.color = PNFreshGreen;
    data03.itemCount = self.line3.xLabels.count;
    data03.getData = ^(NSUInteger index) {
        CGFloat yValue = [data03Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
        
    };
    
    self.line3.chartData = @[data03];
    [self.line3 strokeChart];

    
//      }
//        [self.view addSubview:self.line];
    self.line4 = [[PNLineChart alloc]initWithFrame:CGRectMake(3*320.0/320.0*SCREEN_WIDTH,-60, 320.0/320.0*SCREEN_WIDTH, 200.0/568.0*SCREEN_HEIGHT)];
    //    x坐标
    //    网络请求的数据
    [self.line4 setXLabels:@[@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1",@"E1"]];
    
    //   Line Chart No.1
    
    //   y数据
    
    NSArray * data04Array = @[@60.1, @160.1, @126.4, @262.2, @186.2,@60.1, @160.1, @126.4, @262.2, @186.2];
    PNLineChartData *data04 = [PNLineChartData new];
    data04.color = PNFreshGreen;
    data04.itemCount = self.line4.xLabels.count;
    data04.getData = ^(NSUInteger index) {
        CGFloat yValue = [data04Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
        
    };
    
    self.line4.chartData = @[data04];
    [self.line4 strokeChart];
    
    UILabel *ChineseL = [[UILabel alloc]initWithFrame:CGRectMake(130.0/320.0*SCREEN_WIDTH, 200.0/320.0*SCREEN_WIDTH, 60.0/320.0*SCREEN_WIDTH, 50.0/320.0*SCREEN_WIDTH)];
    ChineseL.text = @"语文";
//    ChineseL.backgroundColor = [UIColor grayColor];

    UILabel *MathL = [[UILabel alloc]initWithFrame:CGRectMake(130.0/320.0*SCREEN_WIDTH+SCREEN_WIDTH, 200.0/320.0*SCREEN_WIDTH, 60.0/320.0*SCREEN_WIDTH, 50.0/320.0*SCREEN_WIDTH)];
    MathL.text = @"数学";
//    MathL.backgroundColor = [UIColor grayColor];
    
    UILabel *EnglishL = [[UILabel alloc]initWithFrame:CGRectMake(130.0/320.0*SCREEN_WIDTH+SCREEN_WIDTH*2, 200.0/320.0*SCREEN_WIDTH, 60.0/320.0*SCREEN_WIDTH, 50.0/320.0*SCREEN_WIDTH)];
    EnglishL.text = @"英语";
//    EnglishL.backgroundColor = [UIColor grayColor];
    
    UILabel *TotalL = [[UILabel alloc]initWithFrame:CGRectMake(130.0/320.0*SCREEN_WIDTH+SCREEN_WIDTH*3, 200.0/320.0*SCREEN_WIDTH, 60.0/320.0*SCREEN_WIDTH, 50.0/320.0*SCREEN_WIDTH)];
    TotalL.text = @"总成绩";
//    TotalL.backgroundColor = [UIColor grayColor];
   
    [self.scrollView addSubview:ChineseL];
    [self.scrollView addSubview:MathL];
    [self.scrollView addSubview:EnglishL];
    [self.scrollView addSubview:TotalL];
    [self.scrollView addSubview:self.line1];
    [self.scrollView addSubview:self.line2];
    [self.scrollView addSubview:self.line3];
    [self.scrollView addSubview:self.line4];


    [self.view addSubview:self.scrollView];
    

}
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
