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
#import "MineService.h"
@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UITextViewDelegate>
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

@property (strong,nonatomic)UIView *tapView;
@property (strong,nonatomic)UIView *tapView2;

@property (strong,nonatomic)UITapGestureRecognizer *tap;
@property (strong,nonatomic)UITapGestureRecognizer *tap2;

@property (strong,nonatomic)NSMutableDictionary *diqu;

@property (copy,nonatomic)NSString *str;
/**
 *  详细地址的str
 */
@property (copy,nonatomic)NSString *aStr;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.title = @"我的地址";
    self.diqu = [NSMutableDictionary dictionaryWithCapacity:0];
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(15, 10, 10, 20)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftButton) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0,30,12)];
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [rightBtn setTitle:@"保存" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.tabView = [[UITableView alloc]initWithFrame:CGRectMake(0,8, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.backgroundColor = COLOR(248.0, 248.0, 248.0, 1);
    self.tabView.tableFooterView = [[UIView alloc]init];
    self.tabView.scrollEnabled = NO;
    [self.view addSubview:_tabView];
    self.infoArr = @[@"选择地区",@"详细地址",@"地区信息",@"详细地址"];
    
    self.picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-400)];
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
    
    self.picker.dataSource = self;
    self.picker.delegate = self;
    

    [self.view addSubview:_picker];
    self.picker.hidden = YES;
    
    self.tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapWay)];
     self.tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapWayWay)];
    
    
    self.tapView = [[UIView alloc]init];
    self.tapView.backgroundColor = [UIColor clearColor];
    self.tapView.frame = CGRectMake(0,64, SCREEN_WIDTH,400-64);
    self.tapView.hidden = YES;
    [self.tapView addGestureRecognizer:_tap];
    [self.view addSubview:_tapView];
    
    self.tapView2 = [[UIView alloc]init];
    self.tapView2.backgroundColor = [UIColor clearColor];
    self.tapView2.frame = CGRectMake(0,64, SCREEN_WIDTH,400-64);
    self.tapView2.hidden = YES;
    [self.tapView2 addGestureRecognizer:_tap2];
    [self.view addSubview:_tapView2];
    
    
    /**
     请求地址
     */
         MineService *ss = [[MineService alloc]init];
    [ss requestInfoWithjiazhangId:_jiazhangid andWithSuccessInfo:^(NSDictionary *dic) {
        NSString *dizhi = dic[@"data"][@"jiazhang_dizhi"];
        NSArray* stringArray = [dizhi componentsSeparatedByString: @"-"];
        if (stringArray.count != 2) {
            
        }else{
        NSString  *yearString = [stringArray objectAtIndex:0];
        NSString  *mouthString = [stringArray objectAtIndex:1];
        self.str = yearString;
        self.aStr = mouthString;
        [self.tabView reloadData];
        }
    }];

}
-(void)leftButton{
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 44;
    }else{
        return 64;
    }
    
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
            cell.text1.delegate = self;

            cell.textLab.hidden = YES;
            cell.text1.text = _str;
            cell.text1.placeholder = @"地区信息";
    
    if (indexPath.row == 0) {
        cell.text1.hidden = NO;
       
        cell.text2.hidden = YES;

    }else{
        cell.text1.hidden = YES;
        cell.text2.hidden = NO;
        cell.text2.text = _aStr;
        cell.text2.textColor = [UIColor blackColor];
        cell.text2.delegate = self;
    }
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
        [self.picker reloadComponent:1];
        [self.picker reloadComponent:2];
        [self.diqu setObject:_province[row] forKey:@"0"];
               }
    if (component == 1) {
        [self.picker reloadComponent:2];
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        if (citys.count-1 < row) {
            
        }else{
            [self.diqu setObject:citys[row] forKey:@"1"];

        }

                  }
    if (component == 2) {
        [self.picker reloadComponent:2];
        NSInteger rowProvince = [pickerView selectedRowInComponent:0];
        NSString *provinceName = _province[rowProvince];
        NSArray *citys = _city[provinceName];
        NSInteger rowCity = [pickerView selectedRowInComponent:1];
        NSString *cityName = citys[rowCity];
        NSArray *country = _country[cityName];
        if (country.count-1 < row) {
                }else{
           [self.diqu setObject:country[row] forKey:@"2"];        }

      
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
    
    pickerLabel.text=[self pickerView:pickerView titleForRow:row forComponent:component];
    return pickerLabel;
   
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        
         }else{
             
    }

}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    _str = nil;
    if ([textField.placeholder isEqualToString:@"地区信息"]) {
        self.picker.hidden = NO;
        [self.picker selectRow:0 inComponent:0 animated:YES];
        [self.picker selectRow:0 inComponent:1 animated:YES];
        [self.picker selectRow:0 inComponent:2 animated:YES];

        self.tapView.hidden= NO;
        [UIView animateWithDuration:0.5 animations:^{
            self.picker.frame = CGRectMake(0, 400, SCREEN_WIDTH, SCREEN_HEIGHT-400);
        }];
        [self.picker reloadAllComponents];
        [self.view endEditing:YES];
        

    }else{
          }
}

-(void)tapWayWay{
    [self.view endEditing:YES];
         self.tapView2.hidden = YES;
}

-(void)tapWay{
    
    if ( _diqu[@"0"]==nil) {
       _diqu[@"0"] = @"北京市";
        _diqu[@"1"] = @"北京市";
        _diqu[@"2"] = @"东城区";
    }
    if (_diqu[@"1"]==nil) {
        NSString *stt = _diqu[@"0"];
        _diqu[@"1"] = _city[stt][0];
         NSString *stt1 = _diqu[@"1"];
        _diqu[@"2"] = _country[stt1][0];
    }
    if (_diqu[@"2"]==nil&&_diqu[@"1"]!=nil) {
        _diqu[@"2"] = _country[_diqu[@"1"]][0];
    }
    self.str = [NSString stringWithFormat:@"%@%@%@",_diqu[@"0"],_diqu[@"1"],_diqu[@"2"]];
   
    NSLog(@"%@",_str);
    [UIView animateWithDuration:0.5 animations:^{
        self.picker.frame = CGRectMake(0,  SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-400);

    } completion:^(BOOL finished) {
        self.picker.hidden = YES;

    }];
    
    self.tapView.hidden = YES;
    [self.tabView reloadData];
    _diqu[@"0"]=nil;
    _diqu[@"1"]=nil;
    _diqu[@"2"]=nil;
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    _aStr = nil;
    if (![textView.text  isEqual: @"详细地址"]) {
       
    }else{
         textView.text = @"";
    }
    
    
    self.tapView2.hidden= NO;
       return YES;
}

-(BOOL)textViewShouldEndEditing:(UITextView *)textView{
            if ([textView.text isEqualToString:@""]) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 10;
        NSDictionary *attributes = @{
                                     NSFontAttributeName:[UIFont systemFontOfSize:12],
                                     NSParagraphStyleAttributeName:paragraphStyle,
                                     NSForegroundColorAttributeName:[UIColor grayColor]
                                     };
        
        textView.attributedText = [[NSAttributedString alloc]initWithString:@"详细地址" attributes:attributes];
        }else{
            self.aStr = textView.text;
        }
    
    

    return YES;
}

-(void)textViewDidBeginEditing:(UITextView *)textView{
    textView.textColor = [UIColor blackColor];
}

#pragma mark 保存上传地址
-(void)rightBtn{
    if (_str != nil&&_aStr!= nil) {
        NSString *sss = [NSString stringWithFormat:@"%@-%@",_str,_aStr];
        
        MineService *ss = [[MineService alloc]init];
        NSString *jiazhangid = [NSString stringWithFormat:@"%d",_jiazhangid];
        NSDictionary *dic = @{@"jiazhangId":jiazhangid,
                              @"diZhi":sss,
                              };
        
        [ss requestInfoWithDic:dic andWithSuccessInfo:^(NSDictionary *dizhi) {
            NSString *str = dizhi[@"code"];
            long  int yy = str.intValue;
            if (yy == 200) {
                [self alertTitle:@"保存成功" delay:0.5];
 
            }
            NSLog(@"%@",str);
            
            
        }];
    }else{
        [self alertTitle:@"无法保存" delay:0.5];
    }
    
    
}

-(void)alertTitle:(NSString *)title delay:(NSTimeInterval)delay{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    [UIView animateKeyframesWithDuration:5 delay:delay options:UIViewKeyframeAnimationOptionLayoutSubviews animations:^{
        
    } completion:^(BOOL finished) {
        [alert dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
    
}
@end
