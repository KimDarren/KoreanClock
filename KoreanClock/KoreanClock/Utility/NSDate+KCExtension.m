//
//  NSDate+KCExtension.m
//  KoreanClock
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import "NSDate+KCExtension.h"

@implementation NSDate (KCExtension)

- (NSInteger)hour
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    NSInteger hour = [components hour];
    return hour;
}

- (NSInteger)minute
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:(NSCalendarUnitHour | NSCalendarUnitMinute) fromDate:self];
    NSInteger minute = [components minute];
    return minute;
}

@end
