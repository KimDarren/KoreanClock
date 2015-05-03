//
//  KCDataUtility.h
//  KoreanClock
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KCDataUtility : NSObject

+ (NSArray *)hourCharacters;
+ (NSArray *)hourRawCharacters;

+ (NSArray *)minuteCharacters;
+ (NSArray *)minuteRawCharacters;

+ (NSArray *)characters;
+ (NSArray *)rawCharacters;

+ (NSArray *)tagsWithHour:(NSInteger)hour;
+ (NSArray *)tagsWithRawCharacters:(NSArray *)raws andHour:(NSInteger)hour;
+ (NSArray *)tagswithMinute:(NSInteger)minute;

@end