//
//  MeRongYuViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MeRongYuViewController.h"
#import "MeRongyuTableViewCell.h"
#import "MineService.h"
#import "Define.h"
@interface MeRongYuViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic)UITableView *myTab;

@property (strong,nonatomic)NSDictionary *dic;

@property (strong,nonatomic)NSArray *arr;
@property (strong,nonatomic)NSMutableArray *arr1;
@property (strong,nonatomic)NSMutableArray *arr2;

@end

@implementation MeRongYuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR(248.0, 2148.0, 248.0, 1);
    self.navigationItem.title = @"学生荣誉";

    self.myTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.myTab.dataSource = self;
    self.myTab.delegate = self;
    self.myTab.separatorStyle = UITableViewCellSeparatorStyleNone;

    [self.view addSubview:_myTab];

    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    self.arr1 = [NSMutableArray arrayWithCapacity:0];
    self.arr2 = [NSMutableArray arrayWithCapacity:0];
//    self.dic = @{@"2016-03-20":@"123456789",
//                 @"2016-04-03":@"gijgaehriogjaoprgjporegerth",
//                 @"2016-04-02":@"bgijgojropgkepro",
//                 };
//    self.arr = [_dic allKeys];
    
    MineService *ms = [[MineService alloc]init];
   [ms requestInfoWithtstudentId:_stuId andWithSuccessInfo:^(NSDictionary *stuRongyudic) {
       self.arr = stuRongyudic[@"data"];
       
       for (NSDictionary *ddd in _arr) {
         NSString *time = ddd[@"rongyu_time"];
           NSArray* stringArray = [time componentsSeparatedByString: @"-"];
           NSString  *mouthString = [stringArray objectAtIndex:1];
           NSString* dayString = [stringArray objectAtIndex: 2];
           [self.arr1 addObject:mouthString];
           [self.arr2 addObject:dayString];
       }
       [self.myTab reloadData];
   }];

}
-(void)leftButton{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Id = @"123";
    MeRongyuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
    if (cell == nil) {
        cell = [[MeRongyuTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.yueLab.text = _arr1[indexPath.row];
    cell.DayLab.text = _arr2[indexPath.row];
    cell.contentLab.text = _arr[indexPath.row][@"rongyu_content"];
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr2.count;
}
@end
