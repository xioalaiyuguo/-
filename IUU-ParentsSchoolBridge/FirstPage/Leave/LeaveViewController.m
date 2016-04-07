//
//  LeaveViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "LeaveViewController.h"
#import "Define.h"
#import "LeaveCellTableViewCell.h"
#import "LeaveWhyTableViewCell.h"
#import "HistoryViewController.h"
#import "RequestInternet.h"

@interface LeaveViewController ()<UITableViewDataSource,UITableViewDelegate,UITextViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic)UITableView *myTableview;
@property (strong, nonatomic)NSArray *arrCell;
@property (strong, nonatomic)NSArray *arrCellPlace;
@property (strong, nonatomic)NSArray *pickViewArr;
@property (strong, nonatomic)NSArray *pickTitleArr;

@property (assign, nonatomic) long int a;

@property (strong, nonatomic)UIPickerView *myPick;
@property (strong, nonatomic)UIButton *pickHidden;

@property (strong, nonatomic)UIView *viewBackground;
@property (strong, nonatomic)UIView *viewBackground1;

@property (copy, nonatomic) NSString *pickText;

@property (strong, nonatomic) NSMutableDictionary *textStrDic;

@property (strong, nonatomic) NSMutableArray *timeArr;

@property (assign, nonatomic) BOOL isYes;
@end

@implementation LeaveViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIView animateWithDuration:0.5 animations:^{
        self.myTableview.frame = CGRectMake(0, 0, WIDTH, HEIGHT-150);
        
    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置
    [self navigation];
    
    [self table];
    self.a = 0;
    
    self.isYes = YES;
    self.arrCell = @[@"请假类型",@"开始时间",@"结束时间",@"请假天数"];
    self.arrCellPlace = @[@"请选择类型",@"请选择开始时间",@"请选择结束时间"];
    
    //选择框设置
    [self selectFrame];
    
    self.textStrDic = [NSMutableDictionary dictionaryWithCapacity:0];

//    self.pickViewArr = @[_pick1,_pick2,_pick3];
    // Do any additional setup after loading the view.
}

- (void)selectFrame{
    
    self.myPick = [[UIPickerView alloc]init];
    self.myPick.frame = CGRectMake(0, 0, WIDTH, 200);
    self.myPick.delegate = self;
    self.myPick.dataSource = self;
    
    
    self.pickHidden = [[UIButton alloc]init];
    self.pickHidden.frame = CGRectMake(WIDTH/2-50, 200, 100,30);
    self.pickHidden.backgroundColor = COLOR(94, 207, 150, 1);
    self.pickHidden.titleLabel.font = FONT(15);
    self.pickHidden.layer.cornerRadius = 5;
    [self.pickHidden setTitle:@"确定" forState:UIControlStateNormal];
    [self.pickHidden addTarget:self action:@selector(hidden) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.viewBackground1 = [[UIView alloc]initWithFrame:CGRectMake(0, -HEIGHT+250+64, WIDTH, HEIGHT-250-64)];
    self.viewBackground1.alpha = 0.1;
    self.viewBackground1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_viewBackground1];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidden)];
    
    [self.viewBackground1 addGestureRecognizer:tap];
    self.viewBackground = [[UIView alloc]initWithFrame:CGRectMake(0, HEIGHT, WIDTH, 250)];
    self.viewBackground.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.viewBackground addSubview:_pickHidden];
    [self.viewBackground addSubview:_myPick];

}
#pragma mark 取当天时间
- (NSString *)todayTime{
    
    NSDateFormatter *today = [[NSDateFormatter alloc]init];
    
    [today setDateFormat:@"YYYY-MM-dd"];
    
    NSString *timetoday = [today stringFromDate:[NSDate date]];
    
  
    return timetoday;
    
}
#pragma mark 取当月天数
- (NSInteger)days{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    
    
//    NSRange range = [calendar rangeOfUnit:NSDayCalendarUnitinUnit:NSMonthCalendarUnitforDate:[NSDate date]];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    
    
    NSUInteger numberOfDaysInMonth = range.length;
    return numberOfDaysInMonth;
    
}

#pragma mark 隐藏遮盖
- (void)hidden{
    
    [UIView animateWithDuration:1 animations:^{
       
        self.viewBackground.frame = CGRectMake(0, HEIGHT, WIDTH, 250);
        
        self.viewBackground1.frame = CGRectMake(0, -HEIGHT+250+64, WIDTH, HEIGHT-250-64);
    }];
//    self.viewBackground.alpha = 0.0;
    
    [self.myTableview reloadData];
    
}

#pragma mark 导航栏设置
- (void)navigation{
    self.navigationController.navigationBarHidden = NO;
    self.view.backgroundColor = COLOR(248, 248, 248, 1);
    self.navigationItem.title = @"请假";
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    
    [leftBtn addTarget:self action:@selector(backFirst) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    self.navigationItem.leftBarButtonItem = backBtn;
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH-80, 10, 70, 20)];
    rightBtn.titleLabel.font = FONT(16);
    [rightBtn setTitle:@"请假记录" forState:UIControlStateNormal];
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    [rightBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = right;
}
- (void)backFirst{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark 跳转到请假记录
- (void)next{
    
    HistoryViewController *HVC = [[HistoryViewController alloc]init];
    
    [self.navigationController pushViewController:HVC animated:YES];
    
    self.isYes = YES;
    self.textStrDic = [[NSMutableDictionary alloc]init];
    [self.myTableview reloadData];
    
    
}
#pragma mark tableview布局
- (void)table{
    
    self.myTableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-80) style:UITableViewStyleGrouped];
    self.myTableview.backgroundColor = COLOR(248, 248, 248, 1);
    [self.view addSubview:_myTableview];
    
    self.myTableview.separatorStyle = UITableViewCellSelectionStyleNone;
    self.myTableview.showsVerticalScrollIndicator = NO;
    self.myTableview.delegate = self;
    self.myTableview.dataSource = self;
    
    
    UIButton *sendBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, HEIGHT-100, WIDTH-20, 30)];
    
    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
    sendBtn.backgroundColor = COLOR(94, 207, 150, 1);
    sendBtn.layer.cornerRadius = 5;
    sendBtn.clipsToBounds = YES;
    sendBtn.titleLabel.font = FONT(15);
//    sendBtn.layer.masksToBounds = YES;
    [self.view addSubview:sendBtn];
    
    [sendBtn addTarget:self action:@selector(sendToTeacher) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark 发送到老师
- (void)sendToTeacher{
//     [self.myTableview reloadData];
    NSString *strDays = [self.textStrDic objectForKey:@"请假天数"];
    NSLog(@"%@",strDays);
    NSString *strReason = [self.textStrDic objectForKey:@"reason"];
    
    if (strDays.length > 0 && strReason.length > 0 ) {
        NSString *str = [NSString stringWithFormat:@"starttime=%@&stoptime=%@&reason=%@&jiazhangid=1",[self.textStrDic objectForKey:@"开始时间"],[self.textStrDic objectForKey:@"结束时间"],[self.textStrDic objectForKey:@"reason"]];
        
        
        [RequestInternet requestGetString:str orPostDic:nil url:LEAVE_URL WithSuccess:^(NSDictionary *successDic) {
            
            NSDictionary *dic = successDic;
    
            NSLog(@"");
            NSString *str =[dic objectForKey:@"code"];
            if (str.intValue == 200) {
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"发送成功" preferredStyle:UIAlertControllerStyleActionSheet];
                
                UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    
                   
                }];
                [alert addAction:action];
                
                [self presentViewController:alert animated:YES completion:nil];
            }
            NSLog(@"%@",dic);
        }];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请完善请假内容" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];

        
    }
    
    
    
    
    self.isYes = YES;
    self.textStrDic = [[NSMutableDictionary alloc]init];
    [self.myTableview reloadData];
    
}

#pragma mark 开始编辑时table位置变化
- (void)textViewDidBeginEditing:(UITextView *)textView{
    
        [UIView animateWithDuration:0.5 animations:^{
            
    self.myTableview.frame = CGRectMake(0, -205, WIDTH, HEIGHT-150);
    
            }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return 15;
    }else if(section ==4){
        
        return 15.1;
    }else{
        
        return 0.1;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 4) {
        return 100;
    }else{
        return 35;
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid = @"cellkey";
    static NSString *cellid1 = @"cellidkey";
//    NSLog(@"%ld",indexPath.section);

        if (indexPath.section != 4) {
            LeaveCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
        
           if (cell == nil) {
            cell = [[LeaveCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
            }
            
            cell.typeLabel.text = _arrCell[indexPath.section];
//            NSLog(@"%ld",(long)indexPath.section);
//            NSLog(@"%@", _arrCell[indexPath.section]);
            if (indexPath.section == 3) {
                
                
                NSString *str1 = [_textStrDic objectForKey:_arrCell[1]];
                
                NSString *str2 = [_textStrDic objectForKey:_arrCell[2]];
                if (str1.length > 0 && str2.length > 0) {
                    
                    NSInteger index1 = [self.timeArr indexOfObject:str1];
                    NSInteger index2 = [self.timeArr indexOfObject:str2];
                    NSString *textstr = [NSString stringWithFormat:@"%ld",index2-index1];
                    if (index2-index1 < 0) {
                        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"错误" message:@"时间选择错误" preferredStyle:UIAlertControllerStyleActionSheet];
                        UIAlertAction *action = [UIAlertAction actionWithTitle:@"重新选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                            
                        }];
                        
                        [alert addAction:action];
                        
                        [self presentViewController:alert animated:YES completion:nil];
                    }else if(index2-index1 == 0){
                        cell.writeLabel2.text = @"半天";
                        
                        [self.textStrDic setObject:@"半天" forKey:_arrCell[3]];
                    }else{
                        cell.writeLabel2.text = textstr;
                        [self.textStrDic setObject:textstr forKey:_arrCell[3]];
                    }
                    
                }else{
                    
                    cell.writeLabel2.text = @"";
                }
                
                
            }else{
                
                if (self.isYes == NO && indexPath.section == 0) {
                    
                    NSLog(@"%ld,****%ld",_a,(long)indexPath.section);
                    
//                    cell.writeLabel1.text = [_textStrDic objectForKey:_arrCell[0]];
                    
                    NSLog(@"*****1");
                    if ([_textStrDic objectForKey:_arrCell[0]] == nil) {
                        cell.writeLabel1.text = self.arrCellPlace[indexPath.section];
                    }else{
                        cell.writeLabel1.text = [_textStrDic objectForKey:_arrCell[0]];
                    }
                    
                }else if(self.isYes == NO && indexPath.section == 1){
                    
                    if ([_textStrDic objectForKey:_arrCell[1]] == nil) {
                        cell.writeLabel1.text = self.arrCellPlace[indexPath.section];
                    }else{
                        cell.writeLabel1.text = [_textStrDic objectForKey:_arrCell[1]];
                    }
                    
                }else if(self.isYes == NO && indexPath.section == 2){
//                    cell.writeLabel1.text = [_textStrDic objectForKey:_arrCell[2]];
                    if ([_textStrDic objectForKey:_arrCell[2]] == nil) {
                        cell.writeLabel1.text = self.arrCellPlace[indexPath.section];
                    }else{
                        cell.writeLabel1.text = [_textStrDic objectForKey:_arrCell[2]];
                    }
                }
                else{
                    cell.writeLabel1.text = self.arrCellPlace[indexPath.section];
                }
                
                
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

                
            }
            
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        
        LeaveWhyTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellid1];
        if (cell1 == nil) {
            cell1 = [[LeaveWhyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid1];
        }
        
//        cell1.whyText.placeholder = @"  请输入请假事由";
        cell1.whyText.font = FONT(13);
        cell1.whyText.delegate = self;
        if (self.isYes == NO) {

            [self.textStrDic setObject:cell1.whyText.text forKey:@"reason"];
        }else{
            cell1.whyText.text = @"";
        }
        
        
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view1 = [[UIView alloc]init];
    
//    view1.backgroundColor = [UIColor redColor];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake( 10, 0, WIDTH-10, 15)];
    
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = FONT(13);
    if (section == 4){
        titleLabel.text = @"请假事由";
    }else{
        titleLabel.text = @" ";
    }
    [view1 addSubview:titleLabel];
    return view1;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *time = [self todayTime];
    NSString *day = [time substringWithRange:NSMakeRange(8, 2)];
    NSString *moon = [time substringWithRange:NSMakeRange(5, 2)];
    NSInteger moontime = moon.integerValue;
    NSInteger time1 = day.integerValue;
    
    NSInteger time2 = [self days];
    self.timeArr = [NSMutableArray arrayWithCapacity:0];
    
    
    
    if (time1+6 > time2) {
        NSInteger needless = time2- time1;
        for (int i = 0; i < needless+1; i++) {
            NSString *next = [NSString stringWithFormat:@"%@%02ld",[time substringWithRange:NSMakeRange(0, 8)],time1+i];
            [self.timeArr addObject:next];
        }
        for (int i = 0; i < 6-needless; i++) {
            NSString *next = [NSString stringWithFormat:@"%@%02ld-%02ld",[time substringWithRange:NSMakeRange(0, 5)],moontime+1,(long)i+1];
            [self.timeArr addObject:next];
        }
        
        
        NSLog(@"%@",self.timeArr);
        
        if (indexPath.section != 4 && indexPath.section != 3) {
            if (indexPath.section == 0) {
                //        [self.pick1 reloadAllComponents];
                
                self.a = 0;
                self.pickTitleArr = @[@"事假",@"病假"];
                
                [self.textStrDic setObject:_pickTitleArr[0] forKey:self.arrCell[_a]];
                NSLog(@"%lu",(unsigned long)_pickTitleArr.count);
                
                self.isYes = NO;
            }else if(indexPath.section == 1){
                
                self.a = 1;
                self.pickTitleArr = self.timeArr;
                [self.textStrDic setObject:_pickTitleArr[0] forKey:self.arrCell[_a]];
                self.isYes = NO;
            }else if(indexPath.section == 2){
                
                self.a = 2;
                self.pickTitleArr = self.timeArr;
                [self.textStrDic setObject:_pickTitleArr[0] forKey:self.arrCell[_a]];
                self.isYes = NO;
            }
            
            [self.myPick reloadAllComponents];
            
            [UIView animateWithDuration:1 animations:^{
                self.viewBackground.frame = CGRectMake(0, HEIGHT-250, WIDTH, 250);
                self.viewBackground1.frame = CGRectMake(0, 64, WIDTH, HEIGHT-250-64);
            }];
            
            self.myPick.backgroundColor = [UIColor clearColor];
            
            [self.view addSubview:_viewBackground];
        }
        
    }else{
        for (int i = 0; i < 7; i++) {
            NSString *next = [NSString stringWithFormat:@"%@%02ld",[time substringWithRange:NSMakeRange(0, 8)],time1+i];
            [self.timeArr addObject:next];
            
        }
        NSLog(@"%ld",(long)time1);
        self.a = indexPath.row;
        if (indexPath.section != 4 && indexPath.section != 3) {
            if (indexPath.section == 0) {
                //        [self.pick1 reloadAllComponents];
                
                self.a = 0;
                self.pickTitleArr = @[@"事假",@"病假"];
                
                [self.textStrDic setObject:_pickTitleArr[0] forKey:self.arrCell[_a]];
                NSLog(@"%lu",(unsigned long)_pickTitleArr.count);
                
                self.isYes = NO;
            }else if(indexPath.section == 1){
                
                self.a = 1;
                self.pickTitleArr = self.timeArr;
                [self.textStrDic setObject:_pickTitleArr[0] forKey:self.arrCell[_a]];
                self.isYes = NO;
            }else if(indexPath.section == 2){
                
                self.a = 2;
                self.pickTitleArr = self.timeArr;
                [self.textStrDic setObject:_pickTitleArr[0] forKey:self.arrCell[_a]];
                self.isYes = NO;
            }
            [self.myPick reloadAllComponents];
            
            [UIView animateWithDuration:1 animations:^{
                self.viewBackground.frame = CGRectMake(0, HEIGHT-250, WIDTH, 250);
                self.viewBackground1.frame = CGRectMake(0, 64, WIDTH, HEIGHT-250-64);
            }];
            
            self.myPick.backgroundColor = [UIColor clearColor];
            
            [self.view addSubview:_viewBackground];
            
        }
        
    }
    
}

#pragma mark 结束编辑table还原
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [UIView animateWithDuration:0.5 animations:^{
       self.myTableview.frame = CGRectMake(0, 0, WIDTH, HEIGHT-150);
        
    }];
    
    [self.view endEditing:YES];
    
    [self.myTableview reloadData];
    
    self.isYes = NO;
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
//    NSLog(@"%d",_pickTitleArr.count);
    return self.pickTitleArr.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    NSString *ww = @"ssd";
    return self.pickTitleArr[row];
}
#pragma mark pick选中
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.pickText = self.pickTitleArr[row];
    
    [self.textStrDic setObject:self.pickText forKey:self.arrCell[_a]];
    
    self.isYes = NO;
    
    NSLog(@"");
}
@end
