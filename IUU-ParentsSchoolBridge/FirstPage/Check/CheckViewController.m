//
//  CheckViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/28.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "CheckViewController.h"
#import "Define.h"
#import "CheckCollectionViewCell.h"
#import "RequestInternet.h"

@interface CheckViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) UICollectionView *collection;

@property (strong, nonatomic) UILabel *dateLabel;

@property (strong, nonatomic) NSDate *todayDate;

@property (strong, nonatomic) NSDate *changeDate;

@property (strong, nonatomic) NSArray *dateArr;

@property (strong, nonatomic) UILabel *detailLabel;

@property (assign, nonatomic) BOOL isYes;

@property (strong, nonatomic) UIView *view1;

@property (copy, nonatomic) NSString *check_code;
@property (copy, nonatomic) NSString *check_time;
@property (copy, nonatomic) NSString *charDay;
@property (copy, nonatomic) NSString *charMoon;
@property (copy, nonatomic) NSString *charMoon1;

//@property (copy, nonatomic) NSString *classid;
//@property (copy, nonatomic) NSString *studentid;


@property (assign, nonatomic)int a;

@end

@implementation CheckViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isYes = NO;
    self.a = 0;
    [UIView animateWithDuration:0.5 animations:^{
        
          self.navigationController.navigationBarHidden = NO;
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //主视图
    [self creatView];
    //顶部导航按键设置
    [self creatNavigation];
    //弹出View的设置
    [self detail];
    

    //数据请求

    
    
            
            NSDictionary *dic = @{@"studentid":@"1",
                                  @"classname":@"1"
                                  };
            
            [RequestInternet requestGetString:nil orPostDic:dic url:CHECK_URL WithSuccess:^(NSDictionary *successDic) {
                NSDictionary *infoDic = successDic;
                
                NSLog(@"%@",infoDic);
                self.check_code = [[infoDic objectForKey:@"data"][0] objectForKey:@"kaoqin_type"];
                self.check_time = [[infoDic objectForKey:@"data"][0] objectForKey:@"kaoqin_time"];
                
                    self.charDay = [_check_time substringWithRange:NSMakeRange(8, 2)];
                    self.charMoon = [_check_time substringWithRange:NSMakeRange(5, 2)];
                
                
                [self.collection reloadData];
                NSLog(@"");
            }];
    
    

//    NSString *strResquest = @"kaoqinid=1&classid=1";
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        NSString *str1 = @"王11号";
//        NSString *str2 = @"一年级一班";
//        [RequestInternet requestInfo:str1 WithSuccess:^(NSDictionary *successDic) {
//            
//            
//        }];
//        [RequestInternet requestInfo:str2 WithSuccess:^(NSDictionary *successDic) {
//            
//            
//        }];
//
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            
//        });
//    });
//    
//    [RequestInternet requestInfo:strResquest WithSuccess:^(NSDictionary *successDic) {
//        
//        NSDictionary *infoDic = successDic;
//        
//        NSLog(@"%@",infoDic);
//        self.check_code = [[infoDic objectForKey:@"data"][0] objectForKey:@"kaoqin_type"];
//        self.check_time = [[infoDic objectForKey:@"data"][0] objectForKey:@"kaoqin_time"];
//        
//        if (self.check_time.length == 9) {
//            self.charDay = [_check_time substringWithRange:NSMakeRange(7, 2)];
//            self.charMoon = [_check_time substringWithRange:NSMakeRange(5, 1)];
//        }else{
//            self.charDay = [_check_time substringWithRange:NSMakeRange(8, 2)];
//            self.charMoon = [_check_time substringWithRange:NSMakeRange(5, 2)];
//        }
//        
//        [self.collection reloadData];
//        NSLog(@"");
//    }];

    
}

//创建主视图
- (void)creatView{
    
    self.dateLabel = [[UILabel alloc]initWithFrame:CGRectMake(80, 74, WIDTH-160, 20)];
    self.dateLabel.textAlignment = 1;
    self.dateLabel.textColor = [UIColor blackColor];
    self.dateLabel.font = [UIFont systemFontOfSize:15];
    [self.view addSubview:_dateLabel];
    
    //左右手势，日历翻页
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(last)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(next)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    
    
    self.changeDate = [NSDate date];
    self.todayDate = _changeDate;
    [self gainDateLabel:_todayDate];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setItemSize:CGSizeMake(self.view.frame.size.width/7, self.view.frame.size.width/7)];
    
    //系统默认左右值为10
    [flowLayout setMinimumInteritemSpacing:0.0];
    [flowLayout setMinimumLineSpacing:0.0];
    
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 104, WIDTH, WIDTH) collectionViewLayout:flowLayout];
    
    self.collection.backgroundColor = [UIColor whiteColor];
    //        self.collection.showsVerticalScrollIndicator = NO;
    self.collection.delegate = self;
    self.collection.dataSource = self;
    
    //自定义cell
    [self.collection registerClass:[CheckCollectionViewCell class] forCellWithReuseIdentifier:@"001"];
    [self.view addSubview:_collection];
    
    UILabel *tipLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 104+WIDTH+10, WIDTH-30, 100)];
    tipLabel.text = @"温馨提示：日历颜色为绿色为全勤，黄色为有缺勤问题，点击有颜色的圆圈可以查看详情！";
    tipLabel.textAlignment = 1;
    tipLabel.numberOfLines = 0;
    tipLabel.textColor = [UIColor redColor];
    tipLabel.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:tipLabel];
    
}


//下方弹出view设置
- (void)detail{
    
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH, HEIGHT)];
    [self.view addSubview:_view1];

    self.detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT-200, WIDTH, 200)];
    self.detailLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.detailLabel.textAlignment = NSTextAlignmentCenter;
    [self.view1 addSubview:_detailLabel];
    //点击手势将view消失
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backaa:)];
    
    [self.view1 addGestureRecognizer:tap];
    
}

//自定义顶部导航按键
- (void)creatNavigation{
    
    self.navigationItem.title = @"考勤";
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back0) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    
}

////返回上一个界面方法
- (void)back0{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)next0{
    
}


- (void)last{
    
    if (self.a == 0) {
        
        [UIView transitionWithView:_collection duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            self.changeDate = [self lastMonth:_changeDate];
            [self gainDateLabel:_changeDate];
        } completion:nil];
    }
    
    self.a =1;
}

- (void)next{
    
    if (self.a == 1) {
        [UIView transitionWithView:_collection duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            self.changeDate = [self nextMonth:_todayDate];
            [self gainDateLabel:_changeDate];
        } completion:nil];
    }
    self.a = 0;
    
    
    
}

//上个月手势的方法
- (NSDate *)lastMonth:(NSDate *)date{
    
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    
    dateComponents.month = -1;
    
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    
    [self.collection reloadData];
    
    return newDate;
}


//下个月手势的方法
- (NSDate *)nextMonth:(NSDate *)date{
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc]init];
    
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:date options:0];
    
    [self.collection reloadData];
    
    return newDate;
    
}


//当天年月获取
- (void)gainDateLabel:(NSDate *)date{
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay) fromDate:date];
    
    NSString *label0 = [NSString stringWithFormat:@"%ld年%02ld月%02ld日",dateComponents.year,dateComponents.month,dateComponents.day];
    
    self.dateLabel.text = label0;
    
    if (label0.length == 10) {
        self.charMoon1 = [label0 substringWithRange:NSMakeRange(5, 1)];
    }else{
        self.charMoon1 = [label0 substringWithRange:NSMakeRange(5, 2)];
    }
    NSLog(@"%lu",self.dateLabel.text.length);
    
    
}

//当天日期
- (NSInteger)day:(NSDate *)date{
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay) fromDate:date];
    
    return dateComponents.day;
    
}

//当月的第一天
- (NSInteger)firstDayInMonth:(NSDate *)date{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    [calendar setFirstWeekday:1];//1.Sun. 2.Mon. 3.Thes. 4.Wed. 5.Thur. 6.Fri. 7.Sat.
    NSDateComponents *comp = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay) fromDate:date];
    
    [comp setDay:1];
    
    NSDate *firstDay = [calendar dateFromComponents:comp];
    
    NSInteger firstDayInMonth = [calendar ordinalityOfUnit:NSCalendarUnitWeekday inUnit:NSCalendarUnitWeekOfMonth forDate:firstDay];
    
    return firstDayInMonth - 1;
    
    
}

//当月的天数
- (NSInteger)numOfDaysInMonth:(NSDate *)date{
    
    NSRange days = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    
    return days.length;
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 7;
    }else{
        return 42;
    }
    
}

//******08
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"001";
    
    NSArray *weakArr = @[@"日",@"一",@"二",@"三",@"四",@"五",@"六"];
    
    CheckCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:str forIndexPath:indexPath];
    
    if (indexPath.section == 0) {
        
        
        cell.layer.cornerRadius = 0;
        [cell.numLabel setTextColor:[UIColor blackColor]];
        
        cell.backgroundColor = [UIColor groupTableViewBackgroundColor];
        cell.layer.cornerRadius = 0;
        cell.numLabel.text = weakArr[indexPath.row];
        cell.numLabel.font = FONT(15);
        
        if (indexPath.row == 0 || indexPath.row == 6) {
            cell.numLabel.textColor = [UIColor redColor];
        }
        return cell;
    }else{
        
        NSInteger numDays = [self numOfDaysInMonth:_changeDate];
        NSInteger firstDay0 = [self firstDayInMonth:_changeDate];
        
        if (indexPath.row < firstDay0) {
            
            cell.numLabel.text = @"";
            [cell.numLabel setTextColor:[UIColor blackColor]];
            cell.backgroundColor = [UIColor whiteColor];
            
        }else if (indexPath.row > firstDay0 + numDays -1){
            
            cell.numLabel.text = @"";
            [cell.numLabel setTextColor:[UIColor blackColor]];
            cell.backgroundColor = [UIColor whiteColor];
            
        }else{
            
            cell.numLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row - firstDay0 +1];
            [cell.numLabel setTextColor:[UIColor blackColor]];
            
            cell.backgroundColor = [UIColor whiteColor];
            
         
            
            if ([_todayDate isEqualToDate:_changeDate]) {
                if (indexPath.row - firstDay0 +1 == [self day:_changeDate]) {
                    
                    [cell.numLabel setTextColor:COLOR(94, 207, 150,1)];
                    
                    cell.numLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];;
                    //                    cell.backgroundColor = [UIColor greenColor];
                }else if (indexPath.row - firstDay0 +1 > [self day:_changeDate]){
                    [cell.numLabel setTextColor:[UIColor grayColor]];
                    cell.backgroundColor = [UIColor whiteColor];
                }
            }else if ([_todayDate compare:_changeDate] == NSOrderedAscending){
                [cell.numLabel setTextColor:[UIColor groupTableViewBackgroundColor]];
                cell.backgroundColor = [UIColor whiteColor];
            }
        }
        
        if ([cell.numLabel.text isEqualToString:_charDay] && self.charMoon == self.charMoon1) {
            cell.backgroundColor = [UIColor redColor];
        }
        cell.layer.cornerRadius = WIDTH/14;
        return cell;
    }
    
    //    cell.backgroundColor = [UIColor whiteColor];
    
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return NO;
    }else{
        
        NSInteger numDays = [self numOfDaysInMonth:_changeDate];
        NSInteger firstDay0 = [self firstDayInMonth:_changeDate];
        
        if (indexPath.row <= firstDay0 + numDays -1 && indexPath.row >= firstDay0){
            
            if ([_changeDate isEqualToDate:_todayDate]) {
                if (indexPath.row <= [self day:_changeDate]+firstDay0-1) {
                    return YES;
                }
            }else if ([_todayDate compare:_changeDate] == NSOrderedDescending){
                return YES;
            }
            
        }
        
    }
    return NO;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger firstDay0 = [self firstDayInMonth:_changeDate];
    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay) fromDate:_changeDate];
    
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    NSLog(@"%@",cell.backgroundColor);
    if (cell.backgroundColor == [UIColor whiteColor]) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.isYes = YES;
            self.view1.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            self.detailLabel.text = @"全勤";
        } ];
    }else{
        
        [UIView animateWithDuration:0.5 animations:^{
            self.isYes = YES;
            self.view1.frame = CGRectMake(0, 0, WIDTH, HEIGHT);
            self.detailLabel.text = @"旷课";
        } ];

    }
//    
    NSLog(@"%ld-%02ld-%02ld",comp.year,comp.month,indexPath.row - firstDay0 + 1);
    
}



- (void)backaa:(UITapGestureRecognizer *)sender{
    
    if (self.isYes == YES) {
        
        self.isYes = NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.view1.frame = CGRectMake(0, HEIGHT, WIDTH, HEIGHT);
        }];
        
    }
   
    
}


@end
