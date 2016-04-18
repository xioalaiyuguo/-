//
//  helpViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/14.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "helpViewController.h"
#import "MineSecondTableViewCell.h"

#import "Define.h"
@interface helpViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic)UITableView *tab;

@property (strong,nonatomic)NSArray *arr;

@end

@implementation helpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR(248, 248, 248, 1.0);
    self.tab = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    self.tab.delegate = self;
    self.tab.dataSource = self;
    self.tab.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tab];
    
    self.arr = @[@"你觉得还有什么需要的功能",@"我把他加入黑名单了，怎么恢复呢？",@"为什么我有时候不能给老师发消息呢？",@"你希望在电脑上使用家校通吗？",@"你在使用过程中遇到哪些问题呢？"];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID= @"123";
    MineSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[MineSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.labName.text = _arr[indexPath.row];
    cell.text2.hidden = YES;
    cell.textLab.hidden = YES;
    cell.text1.hidden = YES;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"常见问题";
}
@end
