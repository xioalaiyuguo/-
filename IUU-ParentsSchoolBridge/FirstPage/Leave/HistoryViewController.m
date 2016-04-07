//
//  HistoryViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/1.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HistoryViewController.h"
#import "Define.h"
#import "HistoryCellTableViewCell.h"
#import "RequestInternet.h"
@interface HistoryViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *mytable;

@property (strong, nonatomic) NSMutableArray *arrText;

@property (strong, nonatomic) NSMutableArray *ARRText;
@property (strong, nonatomic) NSMutableArray *heightArr;
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    //导航栏设置
    [self navigation];
    //table设置
    [self tableview];
    
    self.ARRText = [NSMutableArray arrayWithCapacity:0];
    self.arrText = [NSMutableArray arrayWithCapacity:0];
    self.heightArr = [NSMutableArray arrayWithCapacity:0];
    //数据请求处理
    [self request];
    

}

-(void)navigation{
    
    self.navigationItem.title = @"请假记录";
    
    UIButton *backBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    
    [backBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    
    self.navigationItem.leftBarButtonItem = left;
    
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

}
#pragma mark tableview设置
- (void)tableview{
    
    self.mytable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    
    [self.view addSubview:_mytable];
    
    self.mytable.delegate = self;
    
    self.mytable.dataSource = self;
    self.mytable.showsVerticalScrollIndicator = NO;
    self.mytable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
#pragma mark 返回请假
- (void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

#pragma mark 数据请求及处理
- (void)request{
     NSDictionary *dic = @{@"jiazhangid":@"1"};
    [RequestInternet requestGetString:nil orPostDic:dic url:LEAVE_HISTORY WithSuccess:^(NSDictionary *successDic) {
        
        NSDictionary *dic = successDic;
        NSArray *arr = [dic objectForKey:@"data"];
        for (long int i = arr.count - 1; i >= 0; i--) {
            
            NSString *str = [arr[i] objectForKey:@"leave_reason"];
            
            
            NSString *heightText = [NSString stringWithFormat:@"%f",[self height:str]];
            
            [self.heightArr addObject:heightText];
            
            [self.arrText addObject:[arr[i] objectForKey:@"leave_starttime"]];
            [self.arrText addObject:[arr[i] objectForKey:@"leave_stoptime"]];
            [self.arrText addObject:[arr[i] objectForKey:@"leave_type"]];
            [self.arrText addObject:[arr[i] objectForKey:@"leave_reason"]];
            
            [self.ARRText addObject:_arrText];
            
            self.arrText = [NSMutableArray arrayWithCapacity:0];
            
        }
        
        NSLog(@"%ld",_ARRText.count);
        
        [self.mytable reloadData];
    }];
    
    
}
#pragma mark 字符高度
- (CGFloat)height:(NSString *)text{
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    [label setNumberOfLines:0];
    
    NSDictionary *attribute = @{ NSFontAttributeName : [UIFont systemFontOfSize:12] };
    
    CGSize constraint = CGSizeMake(200, 2000);
    
    CGSize size =[label.text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return size.height;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _ARRText.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *str = self.heightArr[indexPath.row];
    
    return str.floatValue+85+10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellkey";
    
    HistoryCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[HistoryCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        
    }
    
    cell.starTime.text = @"开始时间:";
    cell.endTime.text = @"结束时间:";
    cell.code.text = @"批复状态:";
    cell.because.text = @"请假原因:";
    
    cell.starLabel.text = _ARRText[indexPath.row][0];
    cell.endLabel.text = _ARRText[indexPath.row][1];
    NSString *str = _ARRText[indexPath.row][2];
    if (str.intValue == 0) {
        cell.codeLabel.text = @"待审核";
    }else if (str.intValue == 1){
       cell.codeLabel.text = @"未批准";
    }else{
        cell.codeLabel.text = @"已批准";
    }
    
    cell.becauseLabel.text = _ARRText[indexPath.row][3];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
@end
