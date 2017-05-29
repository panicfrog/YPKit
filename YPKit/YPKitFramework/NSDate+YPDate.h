//
//  NSDate+YPDate.h
//  YPKit
//
//  Created by  yeyongping on 15/2/16.
//  Copyright © 2015年  yeyongping. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (YPDate)

//往前的时间(还未到的时间)
- (instancetype)dateForwardSecs:(NSInteger)secs;
- (instancetype)dateForwardMins:(NSInteger)mins;
- (instancetype)dateForwardHous:(NSInteger)hous;
- (instancetype)dateForwardDays:(NSInteger)days;
- (instancetype)dateForwardWeeks:(NSInteger)weaks;

//后退的时间(之前的时间)
- (instancetype)dateBackwardSecs:(NSInteger)secs;
- (instancetype)dateBackwardMins:(NSInteger)mins;
- (instancetype)dateBackwardHous:(NSInteger)hous;
- (instancetype)dateBackwardDays:(NSInteger)days;
- (instancetype)dateBackwardWeeks:(NSInteger)weaks;

//转成字符串(yyyy-MM-dd HH:mm:ss)
-(NSString *)toStringWithFormatter:(NSString *)formatter;

//获取年.月.天.时.分.秒
- (NSInteger)getSecond;
- (NSInteger)getMinute;
- (NSInteger)getHour;
- (NSInteger)getDay;
- (NSInteger)GetWeekday;
- (NSInteger)getMonth;
- (NSInteger)getYear;

//闰年 闰月
- (BOOL)isLeapMonth;
- (BOOL)isLeapYear;

//去掉秒,分,小时....
- (instancetype)dropSecs;
- (instancetype)dropMins;
- (instancetype)dropHous;
- (instancetype)dropDays;
- (instancetype)dropWeekDays;
@end
