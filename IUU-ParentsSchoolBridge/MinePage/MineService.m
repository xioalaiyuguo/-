//
//  MineService.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/7.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MineService.h"
#import "AFNetworking.h"
#define STUDENTKURL @"http://10.110.5.51:8887/iuuapp/index.php/home/Mine/studentInfo"
#define RONGYUURL @"http://10.110.5.51:8887/iuuapp/index.php/home/Mine/rongyu"
@implementation MineService

-(void)requestInfoWithtjiazhangId:(long)jiazhangId andWithSuccessInfo:(void (^)(NSDictionary *))studentInfo{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = [NSString stringWithFormat:@"%@?jiazhangId=%ld",STUDENTKURL,jiazhangId];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        NSLog(@"%@",dic);
        studentInfo(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"123456");
    }];

    
}

-(void)requestInfoWithtstudentId:(long)studentId andWithSuccessInfo:(void (^)(NSDictionary *))rongyuInfo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = [NSString stringWithFormat:@"%@?studentId=%ld",RONGYUURL,studentId];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        NSLog(@"%@",dic);
        rongyuInfo(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"rongyuInfo");
    }];
    

}

@end
