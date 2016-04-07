//
//  mymessageViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/31.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "mymessageViewController.h"
#import "Define.h"

@interface mymessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(strong,nonatomic)UITableView *table;
@property(strong,nonatomic)UIButton *backbtn;
@property(strong,nonatomic)UIButton *editbtn;
@property(strong,nonatomic)UIButton *telbtn;
@property(strong,nonatomic)UIButton *mesbtn;



@end

@implementation mymessageViewController

//隐藏顶部导航
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;//去除隐藏顶部导航后多余的20像素空白
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 210)];
    image.image = [UIImage imageNamed:@"headimage"];
    
    UIImageView *headiamge = [[UIImageView alloc]initWithFrame:CGRectMake(16, 165, 86, 86)];
    headiamge.layer.cornerRadius = 43.0;
    headiamge.clipsToBounds = YES;
    
    headiamge.image = [UIImage imageNamed:@"101"];
    
    image.userInteractionEnabled = YES;//图片可以交互

    [image addSubview:headiamge];
    //返回按钮
    self.backbtn = [[UIButton alloc]initWithFrame:CGRectMake(19, 26, 16, 28)];
    
    [self.backbtn setBackgroundImage:[UIImage imageNamed:@"返回白色按钮"] forState:UIControlStateNormal];
    
    [self.backbtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

    [image addSubview:self.backbtn];
    
    //tabel
    self.table.tableHeaderView = image;
    self.table.backgroundColor = COLOR(248, 248, 248, 1);
    self.table.tableFooterView = [[UIView alloc]init];
    
    self.table.delegate = self;
    
    self.table.dataSource = self;
    
    [self.view addSubview:self.table];
    
    //电话 聊天按钮
    
    self.telbtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 522, 140, 42)];
    
    self.mesbtn = [[UIButton alloc]initWithFrame:CGRectMake(165, 522, 140, 42)];
    [self.telbtn setBackgroundColor:[UIColor whiteColor]];
    
    [self.telbtn setTitle:@"打电话" forState:UIControlStateNormal];
    
    [self.telbtn setTitleColor:COLOR(92, 206, 150, 1) forState:UIControlStateNormal];
    [self.mesbtn setBackgroundColor:COLOR(92, 206, 150, 1)];
    
    [self.mesbtn setTitle:@"发消息" forState:UIControlStateNormal];
    
    [self.mesbtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.telbtn.layer.cornerRadius = 5.0;
    self.mesbtn.layer.cornerRadius = 5.0;
    
    [self.view addSubview:self.telbtn];
    [self.view addSubview:self.mesbtn];
    
    self.view.backgroundColor = [UIColor whiteColor];
   
}

//按钮返回事件
-(void)back{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 3;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        
        return 10;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"hehe";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.section == 0) {
        
        self.namelabel = [[UILabel alloc]initWithFrame:CGRectMake(139, 25, 61, 15)];
        
        self.namelabel.text = _namearr[_row];
        
        [cell addSubview:self.namelabel];
        
        
        
    }else if (indexPath.section ==1) {
       self.addresslabel = [[UILabel alloc]initWithFrame:CGRectMake(107, 25, 200, 15)];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(22, 25, 61, 15)];
        
        label.text = @"家庭住址";
        label.font = FONT(13);
        self.addresslabel.text = @"江苏省苏州市";
        self.addresslabel.font = FONT(13);
        self.addresslabel.textColor = COLOR(151, 151, 151, 1);
        [cell addSubview:label];
        [cell addSubview:self.addresslabel];
        
    }else{
    self.phonelabel = [[UILabel alloc]initWithFrame:CGRectMake(107, 25, 200, 15)];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(22, 25, 61, 15)];
        
        label.text = @"联系方式";
        label.font = FONT(13);
        self.phonelabel.text = @"13569854152";
        self.phonelabel.font = FONT(13);
        self.phonelabel.textColor = COLOR(151, 151, 151, 1);
        [cell addSubview:label];
        [cell addSubview:self.phonelabel];
    }
    
    
    return cell;
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
