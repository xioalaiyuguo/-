//
//  RequestInternet.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestInternet : NSObject

+ (void)requestGetString:(NSString *)getString orPostDic:(NSDictionary *)postDic url:(NSString *)url WithSuccess:(void(^)(NSDictionary *successDic))success;


@end
