//
//  KCClockViewController.m
//  KoreanClock
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import "KCClockViewController.h"

// View
#import "KCCharacterView.h"

// Utility
#import "KCDataUtility.h"
#import "NSDate+KCExtension.h"

// Library
#import <Masonry/Masonry.h>

@interface KCClockViewController ()

@property (strong, nonatomic) NSArray *characters;
@property (strong, nonatomic) NSArray *rawCharacters;

@property (nonatomic) NSInteger lastHour;
@property (nonatomic) NSInteger lastMinute;

@end

@implementation KCClockViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _characters = [KCDataUtility characters];
        _rawCharacters = [KCDataUtility rawCharacters];
        
        CGFloat width = [UIScreen mainScreen].bounds.size.width/5.0f;
        NSInteger count = 0;
        for (NSArray *lines in _characters) {
            NSInteger y = count/5;
            for (NSString *character in lines) {
                NSInteger x = count%5;
                KCCharacterView *characterView = [[KCCharacterView alloc] initWithCharacter:character];
                characterView.frame = CGRectMake(width*x, 40 + width*y, width, width);
                characterView.tag = count++;
                characterView.tag += 100;
                [self.view addSubview:characterView];
            }
        }
        
        [self reloadTime];
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reloadTime) userInfo:nil repeats:YES];
    }
    return self;
}

- (void)reloadTime
{
    NSInteger hourInteger = [[NSDate date] hour];
    NSInteger minuteInteger = [[NSDate date] minute];
    
    if (_lastHour != hourInteger) {
        _lastHour = hourInteger;
        
        NSArray *hourTags = [KCDataUtility tagsWithRawCharacters:_rawCharacters andHour:hourInteger];
        for (NSNumber *tagNumber in hourTags) {
            NSInteger tagInteger = [tagNumber integerValue];
            KCCharacterView *tagView = (KCCharacterView *)[self.view viewWithTag:100 + tagInteger];
            tagView.status = KCCharacterViewStatusOn;
        }
        
        KCCharacterView *siView = (KCCharacterView *)[self.view viewWithTag:100 + 14];
        siView.status = KCCharacterViewStatusOn;
    }
    
    if (_lastMinute != minuteInteger) {
        _lastMinute = minuteInteger;
        
        for (NSInteger i=15; i<30; i++) {
            KCCharacterView *tagView = (KCCharacterView *)[self.view viewWithTag:100 + i];
            tagView.status = KCCharacterViewStatusOff;
        }
        
        NSArray *minuteTags = [KCDataUtility tagswithMinute:minuteInteger];
        for (NSNumber *tagNumber in minuteTags) {
            NSInteger tagInteger = [tagNumber integerValue];
            KCCharacterView *tagView = (KCCharacterView *)[self.view viewWithTag:100 + tagInteger];
            tagView.status = KCCharacterViewStatusOn;
        }
        
        KCCharacterView *bunView = (KCCharacterView *)[self.view viewWithTag:100 + 29];
        bunView.status = KCCharacterViewStatusOn;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
