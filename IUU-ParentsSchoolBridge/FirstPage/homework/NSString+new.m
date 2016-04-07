//
//  NSString+new.m
//  IUU-ParentsSchoolBridge
//
//  Created by administrator on 16/3/30.
//  Copyright © 2016年 lyf. All rights reserved.
//

#import "NSString+new.h"

@implementation NSString (new)

+(NSString *)getDay{
    NSDateFormatter *time = [[NSDateFormatter alloc]init];
    
    [time setDateFormat:@"YYYY-MM-dd"];
    
     NSString *date = [time stringFromDate:[NSDate date]];
    
    return date;
 
}

+(NSString *)getWeek{
    NSDateFormatter *time = [[NSDateFormatter alloc]init];
    
    [time setDateFormat:@"eeee"];
    
    NSString *date = [time stringFromDate:[NSDate date]];
    
    return date;
    
        
}

+(NSMutableArray *)weekDays:(NSString *)week{
    NSMutableArray *weekDays = [NSMutableArray arrayWithCapacity:0];
    NSString *str = [week substringFromIndex:2];
    if ([str isEqualToString:@"三"]||[week isEqualToString:@"Wednesday"]) {
        [weekDays addObject:@"今日作业"];
        [weekDays addObject:@"星期二作业"];
        [weekDays addObject:@"星期一作业"];
        [weekDays addObject:@"上周五作业"];
        [weekDays addObject:@"上周四作业"];
    }
    if ([str isEqualToString:@"四"]||[week isEqualToString:@"Thursday"]) {
        [weekDays addObject:@"今日作业"];
        [weekDays addObject:@"星期三作业"];
        [weekDays addObject:@"星期二作业"];
        [weekDays addObject:@"星期一作业"];
        [weekDays addObject:@"上周五作业"];
    }
    if ([str isEqualToString:@"五"]||[week isEqualToString:@"Friday"]) {
        [weekDays addObject:@"今日作业"];
        [weekDays addObject:@"星期四作业"];
        [weekDays addObject:@"星期三作业"];
        [weekDays addObject:@"星期二作业"];
        [weekDays addObject:@"星期一作业"];
    }
    if ([str isEqualToString:@"六"]||[str isEqualToString:@"日"]||[week isEqualToString:@"Saturday"]||[week isEqualToString:@"Sunday"]) {
        [weekDays addObject:@"星期五作业"];
        [weekDays addObject:@"星期四作业"];
        [weekDays addObject:@"星期三作业"];
        [weekDays addObject:@"星期二作业"];
        [weekDays addObject:@"星期一作业"];
    }
    if ([str isEqualToString:@"一"]||[week isEqualToString:@"Monday"]) {
        [weekDays addObject:@"今日作业"];
        [weekDays addObject:@"上周五作业"];
        [weekDays addObject:@"上周四作业"];
        [weekDays addObject:@"上周三作业"];
        [weekDays addObject:@"上周二作业"];
    }
    if ([str isEqualToString:@"二"]||[week isEqualToString:@"Tuesday"]) {
        [weekDays addObject:@"今日作业"];
        [weekDays addObject:@"星期一作业"];
        [weekDays addObject:@"上周五作业"];
        [weekDays addObject:@"上周四作业"];
        [weekDays addObject:@"上周三作业"];

    }
    
    return weekDays;
}

+(NSString *)stringWithString:(NSString *)todayString andWithtt:(int)i{
      NSString *tt = todayString;
    int s = i;
    NSString *str;
    NSArray* stringArray = [tt componentsSeparatedByString: @"-"];
    NSString  *yearString = [stringArray objectAtIndex:0];
    NSString  *mouthString = [stringArray objectAtIndex:1];
    NSString* dayString = [stringArray objectAtIndex: 2];
    if (dayString.intValue - i <= 0) {
//        上个月
    int newMouth = mouthString.intValue-1;
    NSString *newMouthStr;
    int lastMouthDays = [NSString howManyDaysInThisMonth:yearString.intValue month:newMouth];
        if (newMouth < 10) {
            newMouthStr = [NSString stringWithFormat:@"0%d",newMouth];
        }else{
             newMouthStr = [NSString stringWithFormat:@"%d",newMouth];
        }
        
    int newDay = lastMouthDays+dayString.intValue - i ;
    NSString *newDayStr;
        if (newDay < 10) {
            newDayStr = [NSString stringWithFormat:@"0%d",newDay];
        }else{
            newDayStr = [NSString stringWithFormat:@"%d",newDay];
        }
    str = [NSString stringWithFormat:@"%@-%@-%@",stringArray[0],newMouthStr,newDayStr];
        
    }else{
      int  day = dayString.intValue -s;
        if (day < 10) {
           str = [NSString stringWithFormat:@"%@-%@-0%d",stringArray[0],stringArray[1],day];
        }else{
            str = [NSString stringWithFormat:@"%@-%@-%d",stringArray[0],stringArray[1],day];
        }
     
    }
   
    return str;
    
}

+(int)howManyDaysInThisMonth:(int)year month:(int)imonth {
    if((imonth == 1)||(imonth == 3)||(imonth == 5)||(imonth == 7)||(imonth == 8)||(imonth == 10)||(imonth == 12))
        return 31;
    if((imonth == 4)||(imonth == 6)||(imonth == 9)||(imonth == 11))
        return 30;
    if((year%4 == 1)||(year%4 == 2)||(year%4 == 3))
    {
        return 28;
    }
    if(year%400 == 0)
        return 29;
    if(year%100 == 0)
        return 28;
    return 29;
}

@end
