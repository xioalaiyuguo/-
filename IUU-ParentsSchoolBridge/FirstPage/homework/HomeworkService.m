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
//作业内容
#define HOMEWORKURL @"http://10.110.5.96:8888/iuu-teacher/index.php/home/HomeWork/homework"


//获取教师信息的URL
#define TEACHERURL @"http://10.110.5.96:8888/iuu-teacher/index.php/home/HomeWork/Photo/teacher"

#define SETIMAGE  @"http://10.110.5.96:8888/iuu-teacher/index.php/home/HomeWorkTeacher/selectImage"

#define PREFIX_URL @"http://10.110.5.96:8888/iuu-teacher/"

//warning 老师头像的url
#define TEACHERIMAGEURL @"http://10.110.5.96:8888/iuu-teacher/"

//获取科目内容的url
#define SUBURL  @"http://10.110.5.96:8888/iuu-teacher/index.php/home/HomeWork/subhomework"

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

- (void )selectImage:(int)homeworkId andWithSuccessInfo:(void (^)(NSArray *))imageInfo{
    
    NSMutableArray *imageArr = [NSMutableArray arrayWithCapacity:0];
    
    AFHTTPSessionManager *manageImage = [AFHTTPSessionManager manager];
    manageImage.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@?hwid=%d",SETIMAGE,homeworkId];
    [manageImage GET:urlPath parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary *dic1 = responseObject;
        NSArray *arr1 = [dic1 objectForKey:@"data"];
        if ( arr1.count > 0) {
            for (int i = 0; i < arr1.count; i ++) {
                
                UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@images/homeWork/%@",PREFIX_URL,[arr1[i]objectForKey:@"image_path"]]]]];
                
                NSLog(@"%@",[NSString stringWithFormat:@"%@images/homeWork/%@",PREFIX_URL,[arr1[i]objectForKey:@"image_path"]]);
                
                [imageArr addObject:image];
                imageInfo(imageArr);
                
                
                NSLog(@"---------%@",imageArr);
                
            }

        }else{
            imageInfo(nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"123456798123456789");
    }];
    
}

-(void)requestsubInfoWithDic:(NSDictionary *)dic andWithSuccessInfo:(void (^)(NSDictionary *))homeworkInfo{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *url = SUBURL;
    [manager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *homeworkDic = responseObject;
        homeworkInfo(homeworkDic);
        
//        NSMutableDictionary *plistDic = [NSMutableDictionary dictionaryWithContentsOfFile: [self plistPath]];
//        
//        if (plistDic == nil) {
//            plistDic = [NSMutableDictionary dictionaryWithCapacity:0];
//        }
//        
//        NSArray *arr =homeworkDic[@"data"];
//        
//        NSString *str =homeworkDic[@"data"][0][@"homework_time"];
//        if (arr != nil & str!=nil) {
//            
//            [plistDic setObject:arr forKey:str];
//            
//            BOOL is = [homeworkDic writeToFile:[self plistPath] atomically:YES];
//            NSLog(@"%d",is);
//            
//            
//        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"1231231213123");
    }];
}

@end
