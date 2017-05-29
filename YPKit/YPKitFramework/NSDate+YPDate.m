//
//  NSDate+YPDate.m
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import "NSDate+YPDate.h"

static inline NSInteger nonnegative(NSInteger num){
    return num >= 0 ? num : 0;
}

@implementation NSDate (YPDate)

- (instancetype)dateForwardSecs:(NSInteger)secs{
    return [self dateByAddingTimeInterval:secs];
}

- (instancetype)dateBackwardSecs:(NSInteger)secs{
    return [self dateByAddingTimeInterval:-secs];
}

- (instancetype)dateForwardMins:(NSInteger)mins{
    return [self dateByAddingTimeInterval:mins*60];
}

- (instancetype)dateBackwardMins:(NSInteger)mins{
    return [self dateByAddingTimeInterval:-mins*60];
}

- (instancetype)dateForwardHous:(NSInteger)hous{
    return [self dateByAddingTimeInterval:hous*60*60];
}

- (instancetype)dateBackwardHous:(NSInteger)hous{
    return [self dateByAddingTimeInterval:-hous*60*60];
}

- (instancetype)dateForwardDays:(NSInteger)days{
    return [self dateByAddingTimeInterval:days*60*60*24];
}

- (instancetype)dateBackwardDays:(NSInteger)days{
    return [self dateByAddingTimeInterval:-days*60*60*24];
}

- (instancetype)dateForwardWeeks:(NSInteger)weaks{
    return [self dateByAddingTimeInterval:weaks*60*24*7];
}

- (instancetype)dateBackwardWeeks:(NSInteger)weaks{
    return [self dateByAddingTimeInterval:-weaks*60*60*24*7];
}

//转成字符串(yyyy-MM-dd HH:mm:ss)
- (NSString *)toStringWithFormatter:(NSString *)formatter{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = formatter;
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return [dateFormatter stringFromDate:self];
}


- (NSInteger)getSecond {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:self] second];
}

- (NSInteger)getMinute {
    return  [[[NSCalendar currentCalendar] components:NSCalendarUnitMinute fromDate:self] minute];
}

- (NSInteger)getHour {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:self] hour];
}

- (NSInteger)getDay {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:self] day];
}

- (NSInteger)GetWeekday {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitWeekday fromDate:self] weekday];
}

- (NSInteger)getMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitMonth fromDate:self] month];
}

- (NSInteger)getYear {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:self] year];
}

- (BOOL)isLeapMonth {
    return [[[NSCalendar currentCalendar] components:NSCalendarUnitQuarter fromDate:self] isLeapMonth];
}

- (BOOL)isLeapYear {
    NSUInteger year = [self getYear];
    return ((year % 400 == 0) || ((year % 100 != 0) && (year % 4 == 0)));
}

//丢掉秒
- (instancetype)dropSecs{
    return [self dateBackwardSecs:[self getSecond]];
}

//丢掉分钟 以及秒
- (instancetype)dropMins{
    return [[self dateBackwardMins:[self getMinute]] dropSecs];
}

//丢掉 小时 分钟 以及秒
- (instancetype)dropHous{
    return [[self dateBackwardHous:[self getHour]] dropMins];
}

- (instancetype)dropDays{
    return [[self dateBackwardDays:nonnegative([self getDay] - 1)] dropHous];
}

- (instancetype)dropWeekDays{
    return [[self dateBackwardDays:nonnegative([self GetWeekday] - 1)] dropHous];
}


@end
