//
//  MineService.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/4/7.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "MineService.h"
#import "AFNetworking.h"
//.........
//#define STUDENTKURL @"http://10.110.5.96:8888/iuu-teacher/index.php/home/Mine/studentInfo"
#define STUDENTKURL @"http://10.110.5.51:8887/iuuapp/index.php/home/Mine/studentInfo"
#define RONGYUURL @"http://10.110.5.96:8888/iuu-teacher/index.php/home/Mine/rongyu"
#define DIZHIYUURL @"http://10.110.5.96:8888/iuu-teacher/index.php/home/Mine/savediZhi"
#define GETDIZHIYUURL @"http://10.110.5.96:8888/iuu-teacher/index.php/home/Mine/getdiZhi"
#define IMAGE_HEADER_URL @"http://10.110.5.51:8887/iuuapp/index.php/home/Mine/uploadimg"
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

-(void)requestInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void (^)(NSDictionary *))homeworkInfo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = DIZHIYUURL;
    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *homeworkDic = responseObject;
        homeworkInfo(homeworkDic);
        
             }
     failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         NSLog(@"123456789");
    }];
}

-(void)requestInfoWithjiazhangId:(long)jiazhangId andWithSuccessInfo:(void (^)(NSDictionary *))dizhi{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = [NSString stringWithFormat:@"%@?jiazhangId=%ld",GETDIZHIYUURL,jiazhangId];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        NSLog(@"%@",dic);
        dizhi(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"123456");
    }];

}

+ (void)PhotoServiceWithData:(NSData *)imageData andSuccess:(void (^)(NSDictionary *))successinfo{
    
//    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
//    NSString *userid = [user stringForKey:@"user_id"];
//    
//    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
//    parameters[@"user_id"] = userid;
//    NSLog(@"userid--%@",userid);
    
    NSString *fileName = [NSString stringWithFormat:@"%d.png",1000];
//    NSString *URL = [NSString stringWithFormat:@"%@",IMAGE_HEADER_URL];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
   
    NSDictionary *dic = @{@"userid":@1};
    
    [manager POST:IMAGE_HEADER_URL parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
//        UIImage *img = [UIImage imageNamed:@"设置"];
//        
//       NSData *testData = UIImageJPEGRepresentation(img, 1.0f);
//        NSLog(@"%@",imageData);
        [formData appendPartWithFileData:imageData name:@"mytouxiang" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        NSLog(@"12456************");
        
        
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"------%@",responseObject);
        successinfo(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSLog(@"failure------");
    }];
}
@end
