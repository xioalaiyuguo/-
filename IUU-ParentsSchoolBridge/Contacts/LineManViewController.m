  //
//  LineManViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/25.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "LineManViewController.h"
#import "Define.h"
#import <QuartzCore/QuartzCore.h>
#import "Cell1.h"
#import "mymessageViewController.h"
#import "mymessage1ViewController.h"


@interface LineManViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating>

@property(strong,nonatomic)UIButton *changebtn1;
@property(strong,nonatomic)UIButton *changebtn2;
@property(strong,nonatomic)UITableView *tabel;
@property(strong,nonatomic)UIView *myview1;
@property(strong,nonatomic)NSMutableDictionary *showdic;
@property(strong,nonatomic)NSArray *rowarr;
@property(strong,nonatomic)NSArray *resultarr;
@property(strong,nonatomic)UISearchController *src;
@property(strong,nonatomic)UIGestureRecognizer *tap;



@end

@implementation LineManViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rowarr = @[@"名明",@"华华",@"强强",@"军军",@"哈哈"];
    
       //分页按钮切换
    self.changebtn1 = [[UIButton alloc]initWithFrame:CGRectMake(100, 10, 60, 24)];
    self.changebtn1.backgroundColor = [UIColor whiteColor];
    self.changebtn2 = [[UIButton alloc]initWithFrame:CGRectMake(160, 10, 60, 24)];
    self.changebtn2.backgroundColor = COLOR(92, 206, 150, 1);
    [self.changebtn1 setTitle:@"联系人" forState:UIControlStateNormal];
    self.changebtn1.titleLabel.font = FONT(12);
    [self.changebtn1 setTitleColor:COLOR(92, 206, 150, 1) forState:UIControlStateNormal];
    [self.changebtn2 setTitle:@"班级群组" forState:UIControlStateNormal];
      self.changebtn2.titleLabel.font = FONT(12);
    [self.changebtn2 setTitleColor:COLOR(255, 255, 255, 1) forState:UIControlStateNormal];
    
    [self.changebtn1.layer setBorderWidth:1.0];
    self.changebtn1.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [self.changebtn2.layer setBorderWidth:1.0];
    self.changebtn2.layer.borderColor = [UIColor whiteColor].CGColor;
    
    //self.changebtn1.layer.cornerRadius = 5.0;
    //切任意一个圆角的弧度
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.changebtn1.bounds      byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerTopLeft    cornerRadii:CGSizeMake(6.0, 6.0)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
   //maskLayer.frame = self.changebtn1.bounds;
    maskLayer.path = maskPath.CGPath;
    self.changebtn1.layer.mask = maskLayer;
   
    
    UIBezierPath *maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.changebtn2.bounds      byRoundingCorners:UIRectCornerBottomRight | UIRectCornerTopRight   cornerRadii:CGSizeMake(6.0, 6.0)];
    CAShapeLayer *maskLayer1 = [CAShapeLayer layer];
    //maskLayer1.frame = self.changebtn2.bounds;
    maskLayer1.path = maskPath1.CGPath;
    self.changebtn2.layer.mask = maskLayer1;
    
    [self.navigationController.navigationBar addSubview:self.changebtn1];
    [self.navigationController.navigationBar addSubview:self.changebtn2];

    
       
    self.tabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.tabel.backgroundColor = COLOR(248, 248, 248, 1);
    self.tabel.delegate = self;
    self.tabel.dataSource = self;
    self.tabel.tableFooterView = [[UIView alloc]init];
    
//    self.navigationController.navigationBar.translucent = NO;
//    self.extendedLayoutIncludesOpaqueBars = YES;
    
    //搜索框
    
    self.src = [[UISearchController alloc]initWithSearchResultsController:nil];
    
    self.src.searchResultsUpdater  =self;
    self.src.dimsBackgroundDuringPresentation = false;
    
    [self.src.searchBar sizeToFit];
    
    self.src.searchBar.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.src.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.src.searchBar.placeholder = @"查找联系人";
    self.src.searchBar.keyboardType = UIKeyboardTypeNamePhonePad;
    
    [self.src.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
    
    self.tabel.tableHeaderView = self.src.searchBar;
    

    
    
    [self.view addSubview:self.tabel];
    
    
    
    self.myview1 = [[UIView alloc]initWithFrame:CGRectMake(0, 64, 320, 504)];
    
    self.myview1.backgroundColor = COLOR(248, 248, 248, 1);
    
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
    view2.backgroundColor = COLOR(255, 255, 255, 1);
    
    UIImageView *classimage = [[UIImageView alloc]initWithFrame:CGRectMake(15, 10, 50, 50)];
    classimage.image = [UIImage imageNamed:@"101"];
    
    classimage.layer.cornerRadius = 25.0;
    classimage.clipsToBounds = YES;
    
    UILabel *classlabel = [[UILabel alloc]initWithFrame:CGRectMake(83, 25, 50, 15)];
    classlabel.text = @"三年二班";
    classlabel.font = FONT(12);
    
    [self.view addSubview:self.myview1];
    self.myview1.hidden = YES;
    [self.myview1 addSubview:view2];
    [self.myview1 addSubview:classlabel];
    [self.myview1 addSubview:classimage];

    
    
    [self.changebtn1 addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.changebtn2 addTarget:self action:@selector(test1) forControlEvents:UIControlEventTouchUpInside];
    
    
    
 }

//-(UISearchController *)searchController{
//    
//    self.definesPresentationContext = YES;
//    
//    return self.src;
//    
//}

//搜索框协议方法
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", self.src.searchBar.text];
    self.resultarr = [[self.rowarr filteredArrayUsingPredicate:searchPredicate] mutableCopy];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tabel reloadData];
    });
    
}


-(void)test{
    
   
    [self.changebtn2 setTitleColor:COLOR(255, 255,255, 1)forState:UIControlStateNormal];
    [self.changebtn1 setTitleColor:COLOR(92, 206, 150, 1) forState:UIControlStateNormal];
    self.myview1.hidden = YES;
    self.tabel.hidden = NO;
    self.changebtn1.backgroundColor = [UIColor whiteColor];
    self.changebtn2.backgroundColor = COLOR(92, 206, 150, 1);

}
-(void)test1{
    
    [self.changebtn2 setTitleColor:COLOR(92, 206, 150, 1) forState:UIControlStateNormal];
    [self.changebtn1 setTitleColor:COLOR(255, 255, 255, 1) forState:UIControlStateNormal];
    
    self.myview1.hidden = NO;
    self.changebtn1.backgroundColor = COLOR(92, 206, 150, 1);
    self.changebtn2.backgroundColor = [UIColor whiteColor];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (!self.src.active) {
        return _rowarr.count;
    }else{
        return _resultarr.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!self.src.active) {
        
    if ([_showdic objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.section]]) {
        return 70;
    }else{
        return 0;
    }
    }else{
        
        return 70;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    NSArray *arr = @[@"三年二班教师",@"三年二班家长"];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, 300, 20)];
    label.text = [NSString stringWithFormat:@"%@",arr[section]];
    
    label.font = FONT(13);
    
    [view addSubview:label];
    
    view.tag = section;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(open:)];
    
    [view addGestureRecognizer:tap];
    
    
    return view;
}

-(void)open:(UITapGestureRecognizer *)sender{
    
    long int num  = sender.view.tag;
    
    if (!_showdic) {
        
        _showdic = [[NSMutableDictionary alloc]init];
    }
    
    NSString *key = [NSString stringWithFormat:@"%ld",num];
    
    if (![_showdic objectForKey:key]) {
        [_showdic setObject:@"1" forKey:key];
    }else{
        
        [_showdic removeObjectForKey:key];
    }
    
    [self.tabel reloadSections:[NSIndexSet indexSetWithIndex:num] withRowAnimation:UITableViewRowAnimationFade];
    
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *str = @"hehe";
    
    Cell1 *cell  = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (cell == nil) {
        cell = [[Cell1 alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
        cell.clipsToBounds = YES;
    }
    
    
    cell.image.image = [UIImage imageNamed:@"101"];
    if (!self.src.active ) {
        cell.label.text = _rowarr[indexPath.row];
    }else{
    cell.label.text = _resultarr[indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        
    mymessageViewController *vc = [[mymessageViewController alloc]init];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
       
    
    [self.src setActive:NO];//搜索框回到最初的状态
        
        
    [vc setHidesBottomBarWhenPushed:YES];
 
    
    [self.navigationController pushViewController:vc animated:YES];
  
    vc.namearr = _rowarr;
    
    vc.row = indexPath.row;
    }
    else{
        
        
        mymessage1ViewController *vc = [[mymessage1ViewController alloc]init];
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        
        [self.src setActive:NO];//搜索框回到最初的状态
        
        
       
        [vc setHidesBottomBarWhenPushed:YES];
        
        
        [self.navigationController pushViewController:vc animated:YES];
        
        vc.namearr = _rowarr;
        
        vc.row = indexPath.row;

        
    }
    
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
