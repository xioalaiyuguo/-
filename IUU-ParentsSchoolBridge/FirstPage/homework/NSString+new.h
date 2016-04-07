//
//  NSString+new.h
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (new)

+(NSString *)getDay;
+(NSString *)getWeek;

+(NSMutableArray *)weekDays:(NSString *)week;
+(NSString *)stringWithString:(NSString *)todayString andWithtt:(int)i;
@end
