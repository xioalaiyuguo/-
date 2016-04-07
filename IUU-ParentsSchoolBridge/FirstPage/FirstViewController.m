//
//  FirstViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/25.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "FirstViewController.h"
#import "Define.h"
#import "HomeCollectionViewCell.h"
#import "CheckViewController.h"
#import "HomeworkViewController.h"
#import "ScoreViewController.h"
#import "LeaveViewController.h"
#import "MessageViewController.h"
@interface FirstViewController ()


@property (strong, nonatomic) NSArray *VCArr;
@end

@implementation FirstViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = COLOR(246, 246, 246, 1);
    self.navigationController.view.backgroundColor = COLOR(255, 255, 255, 1);
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320.0/320.0*SCREEN_WIDTH, 251.0/568.0*SCREEN_HEIGHT)];
    imageV.image = [UIImage imageNamed:@"家长"];
    
    [self.view addSubview:imageV];
    self.picArr = @[@"作业1.1",@"成绩1.1副本",@"请假1.1",@"课程表1.1",@"考勤1.1",@"消息1.1"];
    self.titleArr = @[@"作业",@"成绩",@"请假",@"课程表",@"考勤",@"通知"];
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    flow.minimumInteritemSpacing = 0;
    flow.minimumLineSpacing = 1;
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 230.0/568.0*SCREEN_HEIGHT, 320.0/320.0*SCREEN_WIDTH, 0.66*320.0/568.0*SCREEN_HEIGHT) collectionViewLayout:flow];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.showsVerticalScrollIndicator = NO;
    self.collection.backgroundColor = COLOR(233, 233, 233, 1);
    [self.collection registerClass:[HomeCollectionViewCell class]forCellWithReuseIdentifier:@"cell"];
    
    self.collection.scrollEnabled = NO;
    [self.view addSubview:self.collection];

    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 441.0/568.0*SCREEN_HEIGHT, WIDTH, 1.0/568.0*SCREEN_HEIGHT)];
    line.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:line];
    // Do any additional setup after loading the view.
}
//添加子页面
- (void)addControllers{
    
    CheckViewController *checkVC = [[CheckViewController alloc]init];
    
    HomeworkViewController *homeworkVC = [[HomeworkViewController alloc]init];
    ScoreViewController *scoreVC = [[ScoreViewController alloc]init];
    LeaveViewController *leaveVC = [[LeaveViewController alloc]init];
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    
    self.VCArr = @[homeworkVC,scoreVC,leaveVC,@"",checkVC,messageVC];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.picArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.picView.image = [UIImage imageNamed:_picArr[indexPath.row]];
    cell.titleLab.text = _titleArr[indexPath.row];
    cell.backgroundColor = COLOR(244, 244, 244, 1);
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    double  size = 320.0/320.0*SCREEN_WIDTH/3;
    if (indexPath.row >= 3) {
        return CGSizeMake(size-0.5, size-0.5);
    }else{
        
        return CGSizeMake(size- 0.5, size-0.5);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [self addControllers];
    
    UIViewController *vc = _VCArr[indexPath.row];
    
    vc.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
