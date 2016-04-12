//
//  OneHomeworkViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "OneHomeworkViewController.h"
#import "Define.h"
#import "OneHomeworkTableViewCell.h"
#import "HomeworkModel.h"
#import "teacherView.h"
#import "HomeworkService.h"

//warning 老师头像的url
#define TEACHERIMAGEURL @"http://10.110.5.96:8888/iuu-teacher"

@interface OneHomeworkViewController ()
@property (strong,nonatomic)UITableView *hmTable;
@property (strong,nonatomic)UIView *teacherView;
@property (strong,nonatomic)UITapGestureRecognizer *tabTap;
@property (assign,nonatomic)BOOL show;


//**老师信息的名字*/
@property (strong,nonatomic)NSString *name;

//**老师信息的头像*/
@property (strong,nonatomic)NSString *teacherPic;
/**
 *  图片作业
 */
@property (strong,nonatomic)NSArray *picArr;


//** 获取图片高度*/
@property (assign,nonatomic)CGFloat picHeight;

@end

@implementation OneHomeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR(248, 248, 248, 1);
    
    self.hmTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.hmTable.backgroundColor = COLOR(248, 248, 248, 1);
    self.hmTable.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_hmTable];
    self.hmTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.hmTable.showsVerticalScrollIndicator = NO;
    self.hmTable.delegate = self;
    self.hmTable.dataSource = self;
    NSLog(@"%@",self.hw.teacherid);
    
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backHomeWork) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    
    NSString *title = [NSString stringWithFormat:@"%@作业详情",self.hw.subject];
    self.navigationItem.title = title;

    
   
    
    self.tabTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapWay)];
    self.show = YES;
    [self.hmTable addGestureRecognizer:_tabTap];
    
    HomeworkService *ss = [[HomeworkService alloc]init];
    long int tt = self.hw.teacherid.intValue;
    [ss requestInfoWithteacherId:tt andWithSuccessInfo:^(NSDictionary *ddd) {
        NSString *str = ddd[@"data"][0][@"user_name"];
        self.name = str;
        NSLog(@"%@",_name);
        
        
        NSString *strr = ddd[@"data"][0][@"user_image"];
//        self.teacherPic = strr;
        
        
        NSLog(@"%@",_teacherPic);
        NSData *imagedata =  [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@/image/Header/%@",TEACHERIMAGEURL,strr]]];
        [self.teacherView  removeFromSuperview];
       self.teacherView = [[teacherView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 200) andWithTeacherImageView:imagedata andWithTeacherName:_name andWithSubject:self.hw.subject];
      [self.view addSubview:_teacherView];
    }];
    self.teacherView = [[teacherView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 200) andWithTeacherImageView:nil andWithTeacherName:_hw.teacherName andWithSubject:self.hw.subject];
    [self.view addSubview:_teacherView];
    
    NSString *homeworkimageId = self.hw.homeworkId;
    int hwImage = homeworkimageId.intValue;
    
    [ss selectImage:hwImage andWithSuccessInfo:^(NSArray *arrPic) {
        self.picArr = arrPic;
        NSLog(@"*************%@",_picArr);
        [self.hmTable reloadData];
    }];
    
  
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"cellId";
    OneHomeworkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[OneHomeworkTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId ];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
  
    cell.modelCell = self.hw;
    cell.pic = self.picArr;
    self.picHeight = cell.cellH;
    return cell;

    }

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_picHeight) {
        return _picHeight;
      
    }else{
    HomeworkModel *staus = self.hw;
    NSLog(@"%f",staus.cellHeight);
        return staus.cellHeight;
    }
    
   }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)backHomeWork{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tapWay{
    if (self.show == YES) {
        [UIView animateWithDuration:0.5 animations:^{
            self.teacherView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 200);
            self.show = NO;
        }];
    }else{
    [UIView animateWithDuration:0.5 animations:^{
        self.teacherView.frame = CGRectMake(0, SCREEN_HEIGHT-200, SCREEN_WIDTH, 200);
        self.show = YES;
    }];
    }
}
@end
