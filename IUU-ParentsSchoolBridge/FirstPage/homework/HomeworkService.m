//
//  HomeworkService.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/29.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "HomeworkService.h"
#import "AFNetworking.h"
#import "XXXPlistLocalInfo.h"
#define HOMEWORKURL @"http://10.110.5.51:8887/iuuapp/index.php/home/homework/homework"
#define TEACHERURL @"http://10.110.5.51:8887/iuuapp/index.php/home/homework/teacher"
@implementation HomeworkService
-(void)requestInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void (^)(NSDictionary *))homeworkInfo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = HOMEWORKURL;
    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *homeworkDic = responseObject;
        homeworkInfo(homeworkDic);
   
        NSMutableDictionary *plistDic = [NSMutableDictionary dictionaryWithContentsOfFile: [self plistPath]];
   
        if (plistDic == nil) {
            plistDic = [NSMutableDictionary dictionaryWithCapacity:0];
        }
        
        NSArray *arr =homeworkDic[@"data"];
        
        NSString *str =homeworkDic[@"data"][0][@"homework_time"];
        if (arr != nil & str!=nil) {
            
            [plistDic setObject:arr forKey:str];
            
            BOOL is = [homeworkDic writeToFile:[self plistPath] atomically:YES];
            NSLog(@"%d",is);
            
 
        }
           } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"1231231213123");
    }];
}



-(NSString *)plistPath{
    XXXPlistLocalInfo *info = [[XXXPlistLocalInfo alloc]init];
    NSString *infoPath = [info userInfoPath];
    NSString *lastPath = [infoPath stringByAppendingPathComponent:@"homework.plist"];
//    NSLog(@"%@",lastPath);
    return lastPath;
}

-(void)requestInfoWithteacherId:(long)teacherId andWithSuccessInfo:(void (^)(NSDictionary *))teacherInfo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = [NSString stringWithFormat:@"%@?teacherId=%ld",TEACHERURL,teacherId];
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        NSLog(@"%@",dic);
        teacherInfo(dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
@end
