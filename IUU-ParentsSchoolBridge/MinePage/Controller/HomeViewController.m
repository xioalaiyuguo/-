//
//  HomeViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HomeViewController.h"
#import "MineSecondTableViewCell.h"
#import "Define.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong,nonatomic)UITableView *tabView;
@property (strong,nonatomic)NSArray *infoArr1;
@property (strong,nonatomic)NSArray *infoArr;

/**
 *  日期选择
 */
@property (strong, nonatomic)UIPickerView *picker;
@property (strong,nonatomic)NSMutableArray *province;
@property (strong,nonatomic)NSMutableDictionary *city;
@property (strong,nonatomic)NSMutableDictionary *country;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"我的地址";
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0,8, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.backgroundColor = COLOR(248.0, 248.0, 248.0, 1);
    self.tabView.tableFooterView = [[UIView alloc]init];
    self.tabView.scrollEnabled = NO;
    [self.view addSubview:_tabView];
    self.infoArr = @[@"选择地区",@"详细地址"];
    
    self.picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 400, SCREEN_WIDTH, SCREEN_HEIGHT-400)];
    self.picker.backgroundColor = [UIColor whiteColor];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"area" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    
    self.province = [NSMutableArray arrayWithCapacity:0];
    self.city = [NSMutableDictionary dictionaryWithCapacity:0];
    self.country = [NSMutableDictionary dictionaryWithCapacity:0];

//    NSLog(@"%@",dic);
    for (int i= 0; i<[dic allKeys].count;i++ ) {
        NSString *stri = [NSString stringWithFormat:@"%d",i];
        NSDictionary *dd1 =[dic objectForKey:stri];
      
        NSArray *provinceArr = [dd1   allKeys];
        NSString *province  =  provinceArr[0] ;
        NSDictionary *pro = [dd1 objectForKey:province];
        [self.province addObject:province];
        NSString *city;
        NSMutableArray *rrr = [NSMutableArray arrayWithCapacity:0];
        for (int t = 0; t < [pro allKeys].count ; t++) {
          NSString *strt = [NSString stringWithFormat:@"%d",t];
           //市区字典
          NSDictionary *dd2 =[pro objectForKey:strt];
          city = [dd2 allKeys][0];
          [rrr addObject:city];
          NSArray *arr = [dd2 objectForKey:city];
            [self.country setObject:arr forKey:city];
        }
        [self.city setObject:rrr forKey:province];
      

    }
    
    self.picker.dataSource = self;self.picker.delegate = self;
    [self.view addSubview:_picker];
}
-(void)leftButton{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
        return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
               static  NSString *Id = @"12345";
            MineSecondTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Id];
            if (cell == nil) {
                cell = [[MineSecondTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Id];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
//                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            cell.labName.text = _infoArr[indexPath.row];
            
            cell.textLab.hidden = YES;
    
            return cell;
    
        
  }
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
{
    return 3;
}

#pragma mark - 该方法的返回值决定该控件指定列包含多少个列表项
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (0 == component)
    {
        return _province.count;
    }
    if (1 == component) {
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        return citys.count;
    }else{
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        if (citys.count-1 < rowCity) {
            return 100;
        }else{
        NSString *cityName = citys[rowCity];
        NSArray *country = _country[cityName];
        return country.count;
        }
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (0 == component) {
        return _province[row];
    }
    if(1 == component){
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        
        if (citys.count-1 < row) {
            return citys[0];
         
        }else{
            return citys[row];
        }
        
         }else{
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
             
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSString *cityName;
             if (citys.count-1 < rowCity) {
                 cityName = @"";
                 
             }else{
                  cityName = citys[rowCity];
             }

       
        NSArray *country = _country[cityName];
             if (country.count-1 < row) {
                 return country[0];
                 
             }else{
                 return country[row];
             }
             
     
          }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
//         [self.picker selectRow:0 inComponent:1 animated:YES];
        [self.picker reloadComponent:1];
//       [self.picker selectRow:0 inComponent:2 animated:YES];
        [self.picker reloadComponent:2];
        
               }
    if (component == 1) {
//        [self.picker selectRow:0 inComponent:2 animated:YES];
        [self.picker reloadComponent:2];
           }
}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view

{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
       
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont boldSystemFontOfSize:15]];
    }
    // Fill the label text here
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
   
    
}

@end
