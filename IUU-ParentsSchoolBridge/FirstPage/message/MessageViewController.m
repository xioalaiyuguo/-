//
//  MessageViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/5.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MessageViewController.h"
#import "RequestInternet.h"
#import "Define.h"
#import "MessageCellTableViewCell.h"
@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *myTable;

@property (strong, nonatomic) NSMutableArray *heightArr;

@property (strong, nonatomic) UILabel *l;

@property (strong, nonatomic) NSMutableArray *dataArr;
@property (strong, nonatomic) NSMutableArray *DataARR;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //导航栏设置
    [self navigation];
    //tableview
    [self table];
    
    self.heightArr = [NSMutableArray arrayWithCapacity:0];
    self.dataArr = [NSMutableArray arrayWithCapacity:0];
    self.DataARR = [NSMutableArray arrayWithCapacity:0];
    //网络请求
    [self request];
    
    
    // Do any additional setup after loading the view.
}

#pragma mark 请求数据及处理
- (void)request{
    
    NSDictionary *dic = @{@"classid":@"1"};
    
    [RequestInternet requestGetString:nil orPostDic:dic url:MESSAGE_URL WithSuccess:^(NSDictionary *successDic) {
        
        NSDictionary *dicInfo = successDic;
        NSArray *numArr = [dicInfo objectForKey:@"data"];
        NSString *str = [dicInfo objectForKey:@"code"];
        if (str.intValue == 200) {
            
            for (long int i = numArr.count - 1; i >= 0 ; i--) {
                
                NSString *textstr = [numArr[i] objectForKey:@"notify_content"];
                CGFloat heiget = [self heightLebal:textstr];
                NSString *h = [NSString stringWithFormat:@"%f",heiget];
                [self.heightArr addObject:h];
                
                [self.dataArr addObject:[numArr[i] objectForKey:@"notify_time"]];
                [self.dataArr addObject:[numArr[i] objectForKey:@"notify_title"]];
                [self.dataArr addObject:[numArr[i] objectForKey:@"notify_content"]];
                
                [self.DataARR addObject:_dataArr];
                
                self.dataArr = [NSMutableArray arrayWithCapacity:0];
                
            }
//            NSLog(@"%@",_heightArr);
            
            [self.myTable reloadData];
        }
        
    }];
    
}

#pragma mark table设置
- (void)table{
    
    self.myTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, HEIGHT)];
    self.myTable.delegate = self;
    self.myTable.dataSource = self;
    [self.view addSubview:_myTable];
    self.myTable.separatorStyle = UITableViewCellSelectionStyleNone;
    self.myTable.backgroundColor = COLOR(239, 239, 239, 1);
    self.myTable.showsVerticalScrollIndicator = NO;
}
- (void)navigation{
    
    self.navigationItem.title = @"通知";
    self.navigationController.navigationBarHidden = NO;
    
    UIButton *left = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    
    [left setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftBtn = [[UIBarButtonItem alloc]initWithCustomView:left];
    
    self.navigationItem.leftBarButtonItem = leftBtn;
    
    [left addTarget:self action:@selector(backFirst) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark 字符串高度
- (CGFloat)heightLebal:(NSString *)text{
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    
    paragraph.lineSpacing = 2;
    paragraph.firstLineHeadIndent = 2*13;
    
//    NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraph};
    UILabel *label = [[UILabel alloc] init];
    
    label.text = text;
    [label setNumberOfLines:0];
//    label.attributedText = [[NSAttributedString alloc]initWithString:label.text attributes:dic];
    
    NSDictionary *attribute = @{ NSFontAttributeName : FONT(13) ,NSParagraphStyleAttributeName:paragraph};
    
    CGSize constraint = CGSizeMake(SCREEN_WIDTH-60, MAXFLOAT);
    
    CGSize size =[label.text boundingRectWithSize:constraint options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    
    return size.height;
}
#pragma mark 返回首页
- (void)backFirst{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.heightArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *s = self.heightArr[indexPath.row];
    
//    NSLog(@"height===*=*=*=*===%f",s.floatValue+10+10+35+50);
    return s.floatValue+10+10+35+50+75;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellid = @"cellkey";
    
    MessageCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if (cell == nil) {
        cell = [[MessageCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    
    cell.timeLabel.text = self.DataARR[indexPath.row][0];
    cell.titleLabel.text = self.DataARR[indexPath.row][1];
    
    cell.label1.text = @"各位家长：";
    cell.label3.text = @"谢谢大家合作！";
    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc]init];
    
    paragraph.lineSpacing = 2;
    paragraph.firstLineHeadIndent = 2*13;
    
        NSDictionary *dic = @{NSParagraphStyleAttributeName:paragraph};
    
    
       cell.detailLabel.attributedText = [[NSAttributedString alloc]initWithString:self.DataARR[indexPath.row][2] attributes:dic];
        cell.label2.attributedText = [[NSAttributedString alloc]initWithString:@"你们好！" attributes:dic];
//    cell.detailLabel.text = self.DataARR[indexPath.row][2];
    
    
    
    NSLog(@"======%f",cell.detailLabel.frame.size.height);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}




@end
