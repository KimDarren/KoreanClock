//
//  KCDataUtility.m
//  KoreanClock
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import "KCDataUtility.h"

@implementation KCDataUtility

+ (NSArray *)hourCharacters
{
    return @[@[@"열", @"한", @"다", @"세", @"네"],
             @[@"두", @"여", @"섯", @"일", @"곱"],
             @[@"여", @"덟", @"아", @"홉", @"시"]
             ];
}

+ (NSArray *)minuteCharacters
{
    return @[@[@"이", @"삼", @"사", @"오", @"십"],
             @[@"일", @"이", @"삼", @"사", @"오"],
             @[@"육", @"칠", @"팔", @"구", @"분"]
             ];
}

+ (NSArray *)characters
{
    NSArray *hourCharacters = [self hourCharacters];
    NSMutableArray *characters = [[NSMutableArray alloc] initWithArray:hourCharacters];
    for (NSArray *minutes in [self minuteCharacters]) {
        [characters addObject:minutes];
    }
    
    return characters;
}

+ (NSArray *)hourRawCharacters
{
    NSArray *characters = [self hourCharacters];
    NSMutableArray *rawCharacters = [NSMutableArray new];
    
    for (NSArray *array in characters) {
        for (NSString *character in array) {
            [rawCharacters addObject:character];
        }
    }
    
    return rawCharacters;
}

+ (NSArray *)minuteRawCharacters
{
    NSArray *characters = [self minuteCharacters];
    NSMutableArray *rawCharacters = [NSMutableArray new];
    
    for (NSArray *array in characters) {
        for (NSString *character in array) {
            [rawCharacters addObject:character];
        }
    }
    
    return rawCharacters;
}

+ (NSArray *)rawCharacters
{
    NSArray *characters = [self characters];
    NSMutableArray *rawCharacters = [NSMutableArray new];
    
    for (NSArray *array in characters) {
        for (NSString *character in array) {
            [rawCharacters addObject:character];
        }
    }
    
    return rawCharacters;
}

+ (NSArray *)tagsWithHour:(NSInteger)hour
{
    NSArray *rawCharacters = [self rawCharacters];
    return [self tagsWithRawCharacters:rawCharacters andHour:hour];
}

+ (NSArray *)tagsWithRawCharacters:(NSArray *)raws andHour:(NSInteger)hour
{
    NSArray *rawCharacters = raws;
    NSMutableArray *tags = [NSMutableArray new];
    
    if (hour == 0) {
        NSInteger tag1 = [rawCharacters indexOfObject:@"열"];
        NSInteger tag2 = [rawCharacters indexOfObject:@"두"];
        [tags addObject:@(tag1)];
        [tags addObject:@(tag2)];
        
        return tags;
    }
    
    if (hour >= 10) {
        NSInteger tenTag = [rawCharacters indexOfObject:@"열"];
        [tags addObject:@(tenTag)];
        hour = hour%10;
    }
    
    if (hour == 1) {
        NSInteger tag = [rawCharacters indexOfObject:@"한"];
        [tags addObject:@(tag)];
    } else if (hour == 2) {
        NSInteger tag = [rawCharacters indexOfObject:@"두"];
        [tags addObject:@(tag)];
    } else if (hour == 3) {
        NSInteger tag = [rawCharacters indexOfObject:@"세"];
        [tags addObject:@(tag)];
    } else if (hour == 4) {
        NSInteger tag = [rawCharacters indexOfObject:@"네"];
        [tags addObject:@(tag)];
    } else if (hour == 5) {
        NSInteger tag1 = [rawCharacters indexOfObject:@"다"];
        NSInteger tag2 = [rawCharacters indexOfObject:@"섯"];
        [tags addObject:@(tag1)];
        [tags addObject:@(tag2)];
    } else if (hour == 6) {
        NSInteger tag1 = [rawCharacters indexOfObject:@"여"];
        NSInteger tag2 = [rawCharacters indexOfObject:@"섯"];
        [tags addObject:@(tag1)];
        [tags addObject:@(tag2)];
    } else if (hour == 7) {
        NSInteger tag1 = [rawCharacters indexOfObject:@"일"];
        NSInteger tag2 = [rawCharacters indexOfObject:@"곱"];
        [tags addObject:@(tag1)];
        [tags addObject:@(tag2)];
    } else if (hour == 8) {
        NSInteger tag1 = [rawCharacters indexOfObject:@"여"];
        NSInteger tag2 = [rawCharacters indexOfObject:@"덟"];
        [tags addObject:@(tag1)];
        [tags addObject:@(tag2)];
    } else if (hour == 9) {
        NSInteger tag1 = [rawCharacters indexOfObject:@"아"];
        NSInteger tag2 = [rawCharacters indexOfObject:@"홉"];
        [tags addObject:@(tag1)];
        [tags addObject:@(tag2)];
    }
    
    return tags;
}

+ (NSArray *)tagswithMinute:(NSInteger)minute
{
    NSArray *minutes = [self minuteCharacters];
    NSMutableArray *tags = [NSMutableArray new];
    
    if (minute != 0) {
        [tags addObject:@29];
    }
    
    NSArray *firstArray = minutes[0];
    NSMutableArray *otherArray = [[NSMutableArray alloc] initWithArray:minutes[1]];
    for (NSString *character in minutes[2]) {
        [otherArray addObject:character];
    }
    
    NSInteger ten = minute/10;
    NSInteger one;
    
    if (ten > 0) {
        NSInteger tag1 = [firstArray indexOfObject:@"십"];
        [tags addObject:@(tag1 + 15)];
        one = minute - ten*10;
        
        if (ten == 2) {
            NSInteger tag2 = [firstArray indexOfObject:@"이"];
            [tags addObject:@(tag2 + 15)];
        } else if (ten == 3) {
            NSInteger tag2 = [firstArray indexOfObject:@"삼"];
            [tags addObject:@(tag2 + 15)];
        } else if (ten == 4) {
            NSInteger tag2 = [firstArray indexOfObject:@"사"];
            [tags addObject:@(tag2 + 15)];
        } else if (ten == 5) {
            NSInteger tag2 = [firstArray indexOfObject:@"오"];
            [tags addObject:@(tag2 + 15)];
        }
        
    } else {
        one = minute;
    }
    
    if (one == 1) {
        NSInteger tag1 = [otherArray indexOfObject:@"일"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 2) {
        NSInteger tag1 = [otherArray indexOfObject:@"이"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 3) {
        NSInteger tag1 = [otherArray indexOfObject:@"삼"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 4) {
        NSInteger tag1 = [otherArray indexOfObject:@"사"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 5) {
        NSInteger tag1 = [otherArray indexOfObject:@"오"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 6) {
        NSInteger tag1 = [otherArray indexOfObject:@"육"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 7) {
        NSInteger tag1 = [otherArray indexOfObject:@"칠"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 8) {
        NSInteger tag1 = [otherArray indexOfObject:@"팔"];
        [tags addObject:@(tag1 + 20)];
    } else if (one == 9) {
        NSInteger tag1 = [otherArray indexOfObject:@"구"];
        [tags addObject:@(tag1 + 20)];
    }
    
    return tags;
}

@end
