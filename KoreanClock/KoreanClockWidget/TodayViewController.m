//
//  TodayViewController.m
//  KoreanClockWidget
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) NSString *dateString;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 278);
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(tick) userInfo:nil repeats:YES];
    
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:@"HHmm"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGRect frame = self.view.superview.frame;
    frame = CGRectMake(0, CGRectGetMinY(frame), CGRectGetWidth(frame) + CGRectGetMinX(frame), CGRectGetHeight(frame));
    self.view.superview.frame = frame;
    
    [_timer fire];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNoData);
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_timer invalidate];
}

#pragma mark - Iterator

- (void)tick
{
    [self turnOff];
    NSString *string = self.dateString;
    
    NSInteger firstDigit = [[string substringWithRange:NSMakeRange(0, 1)] integerValue];
    NSInteger secondDigit = [[string substringWithRange:NSMakeRange(1, 1)] integerValue];
    NSInteger thirdDigit = [[string substringWithRange:NSMakeRange(2, 1)] integerValue];
    NSInteger fourthDigit = [[string substringWithRange:NSMakeRange(3, 1)] integerValue];
    
    [_labels[0] setTextColor:(firstDigit) ? [UIColor whiteColor] : [UIColor darkGrayColor]];    // 열
    
    if (firstDigit == 0 && secondDigit == 0) {
        [_labels[0] setTextColor:[UIColor whiteColor]]; // 열
        [_labels[5] setTextColor:[UIColor whiteColor]]; // 두
    }
    
    [_labels[19] setTextColor:(!thirdDigit) ? [UIColor darkGrayColor] : [UIColor whiteColor]];    // 십
    [_labels[29] setTextColor:(!thirdDigit && !fourthDigit) ? [UIColor darkGrayColor] : [UIColor whiteColor]];  // 분
    
    switch (secondDigit) {
        case 1:
            [_labels[1] setTextColor:[UIColor whiteColor]]; // 한
            break;
        case 2:
            [_labels[5] setTextColor:[UIColor whiteColor]]; // 두
            break;
        case 3:
            [_labels[3] setTextColor:[UIColor whiteColor]]; // 세
            break;
        case 4:
            [_labels[4] setTextColor:[UIColor whiteColor]]; // 네
            break;
        case 5:
            [_labels[2] setTextColor:[UIColor whiteColor]]; // 다
            [_labels[7] setTextColor:[UIColor whiteColor]]; // 섯
            break;
        case 6:
            [_labels[6] setTextColor:[UIColor whiteColor]]; // 여
            [_labels[7] setTextColor:[UIColor whiteColor]]; // 섯
            break;
        case 7:
            [_labels[8] setTextColor:[UIColor whiteColor]]; // 일
            [_labels[9] setTextColor:[UIColor whiteColor]]; // 곱
            break;
        case 8:
            [_labels[10] setTextColor:[UIColor whiteColor]];    // 여
            [_labels[11] setTextColor:[UIColor whiteColor]];    // 덟
            break;
        case 9:
            [_labels[12] setTextColor:[UIColor whiteColor]];    // 아
            [_labels[13] setTextColor:[UIColor whiteColor]];    // 홉
            break;
        default:
            break;
    }
    
    switch (thirdDigit) {
        case 2:
            [_labels[15] setTextColor:[UIColor whiteColor]];    // 이
            break;
        case 3:
            [_labels[16] setTextColor:[UIColor whiteColor]];    // 삼
            break;
        case 4:
            [_labels[17] setTextColor:[UIColor whiteColor]];    // 사
            break;
        case 5:
            [_labels[18] setTextColor:[UIColor whiteColor]];    // 오
            break;
            
        default:
            break;
    }
    
    switch (fourthDigit) {
        case 1:
            [_labels[20] setTextColor:[UIColor whiteColor]];    // 일
            break;
        case 2:
            [_labels[21] setTextColor:[UIColor whiteColor]];    // 이
            break;
        case 3:
            [_labels[22] setTextColor:[UIColor whiteColor]];    // 삼
            break;
        case 4:
            [_labels[23] setTextColor:[UIColor whiteColor]];    // 사
            break;
        case 5:
            [_labels[24] setTextColor:[UIColor whiteColor]];    // 오
            break;
        case 6:
            [_labels[25] setTextColor:[UIColor whiteColor]];    // 육
            break;
        case 7:
            [_labels[26] setTextColor:[UIColor whiteColor]];    // 칠
            break;
        case 8:
            [_labels[27] setTextColor:[UIColor whiteColor]];    // 팔
            break;
        case 9:
            [_labels[28] setTextColor:[UIColor whiteColor]];    // 구
            break;
            
        default:
            break;
    }
}

- (void)turnOff
{
    for (UILabel *label in _labels) {
        [label setTextColor:[UIColor darkGrayColor]];
    }
    [_labels[14] setTextColor:[UIColor whiteColor]];
}

#pragma mark - Getter

- (NSString *)dateString
{
    _dateString = [_dateFormatter stringFromDate:[NSDate date]];
    if ([_dateString integerValue] >= 1200)
        return [NSString stringWithFormat:@"%ld", [_dateString integerValue]%1200];
    return _dateString;
}

@end
