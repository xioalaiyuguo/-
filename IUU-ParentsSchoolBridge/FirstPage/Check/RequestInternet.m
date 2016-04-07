//
//  RequestInternet.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "RequestInternet.h"
#import "AFNetworking.h"
#import "Define.h"
@implementation RequestInternet

+ (void)requestGetString:(NSString *)getString orPostDic:(NSDictionary *)postDic url:(NSString *)url WithSuccess:(void (^)(NSDictionary *))success{
    
    AFHTTPSessionManager *manage = [AFHTTPSessionManager manager];
    
    manage.responseSerializer = [AFJSONResponseSerializer serializer];
    
    if (getString == nil) {
        
        [manage POST:url parameters:postDic constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
        
    }else{
        
        NSString *str = [getString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        
        NSString *api = [NSString stringWithFormat:@"%@?%@",url,str];
        
        [manage GET:api parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            success(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
        }];
        
    }
    
    
}

@end
