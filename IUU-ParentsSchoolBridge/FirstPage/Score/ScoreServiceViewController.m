//
//  ScoreServiceViewController.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/6.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "ScoreServiceViewController.h"
#import "AFHTTPSessionManager.h"
#import "FMDB.h"

#define HOMEWORKURL @"http://localhost:8886/patciarch_port/index.php/home/score/score?classname=%E4%B8%80%E5%B9%B4%E7%BA%A7%E4%B8%80%E7%8F%AD&examname=2016%E5%B9%B4%E7%AC%AC%E4%B8%80%E5%AD%A6%E6%9C%9F%E6%9C%9F%E6%9C%AB%E8%80%83%E8%AF%95&studentname=%E7%8E%8B11%E5%8F%B7"
@interface ScoreServiceViewController ()

@end

@implementation ScoreServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//    NSString *dataBasePath = [str stringByAppendingPathComponent:@"results.sqlite"];
//    NSLog(@"%@",dataBasePath);
//    //    获取数据库
//    FMDatabase *db = [FMDatabase databaseWithPath:dataBasePath];
//    //    打开数据库
//    if ([db open]) {
//        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS iuu_results (id integer PRIMARY KEY AUTOINCREMENT, point text NOT NULL, subject text NOT NULL);"];
//        if (result) {
//            NSLog(@"创建成功");
//            
//        }else{
//            
//            NSLog(@"创建失败");
//        }
//    }
//    self.db = db;
//   
    

    // Do any additional setup after loading the view.
}
- (void)requestInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void (^)(NSDictionary *dic1))scoreInfo{
//    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//    NSString *dataBasePath = [str stringByAppendingPathComponent:@"results.sqlite"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = HOMEWORKURL;
    [manager POST:url parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *scoreDic = responseObject;
        scoreInfo(scoreDic);
        NSMutableDictionary *sqliteDic = [NSMutableDictionary dictionaryWithContentsOfFile:[self sqlitePath]];
        if (sqliteDic == nil) {
            sqliteDic = [NSMutableDictionary dictionaryWithCapacity:0];
        }
       NSArray *arr = scoreDic[@"data"];
        for (int i = 0; i < arr.count; i++) {
            NSString *str1 = [arr[i] objectForKey:@"results_point"];
            NSString *str2 = [arr[i] objectForKey:@"results_subject"];
            NSString *point = [NSString stringWithFormat:@"%@",str1];
            NSString *subject = [NSString stringWithFormat:@"%@",str2];
            [self.db executeUpdate:@"INSERT INTO iuu_results(point,subject) VALUES(?,?);",point,subject];
            NSLog(@"%@++++--",self.db);
            [sqliteDic setObject:arr forKey:str1];
        }
        
        BOOL isTrue = [scoreDic writeToFile:[self sqlitePath] atomically:YES];
        if (isTrue) {
            NSLog(@"success");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failed");
    }];
    
    
}
#pragma mark 获取SQLite路径
- (NSString *)sqlitePath{
    NSString *str = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dataBasePath = [str stringByAppendingPathComponent:@"results.sqlite"];
//    获取数据库
    
    FMDatabase *db = [FMDatabase databaseWithPath:dataBasePath];
//    打开数据库
    if ([db open]) {
        BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS iuu_results (id integer PRIMARY KEY AUTOINCREMENT, point text NOT NULL, subject text NOT NULL);"];
        if (result) {
            
            
        }else{
            
           
        }
    }
    self.db = db;

    return dataBasePath;
    
}

//插入数据
- (void)insert{
    
    FMResultSet *resultSet = [self.db executeQuery:@"SELECT *FROM iuu_results"];
        while ([resultSet next]) {
            NSString *point = [resultSet stringForColumn:@"point"];
            NSString *subject = [resultSet stringForColumn:@"subject"];
          NSLog(@"%@,%@",point,subject);
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
