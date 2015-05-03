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

@end
