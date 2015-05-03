//
//  KCMoreViewController.m
//  KoreanClock
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import "KCMoreViewController.h"

// Libarary
#import <Masonry/Masonry.h>

@interface KCMoreViewController ()

@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) UILabel *teamLabel;
@property (strong, nonatomic) UILabel *meanLabel;
@property (strong, nonatomic) UILabel *darrenLabel;
@property (strong, nonatomic) UILabel *minjunLabel;

@property (strong, nonatomic) UIImageView *darrenFace;
@property (strong, nonatomic) UIImageView *minjunFace;
@property (strong, nonatomic) UIImageView *ourFace;

@property (strong, nonatomic) UIButton *backButton;

@end

@implementation KCMoreViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.view.backgroundColor = [UIColor colorWithWhite:.8f alpha:1.0f];
        
        _containerView = [[UIView alloc] init];
        _containerView.backgroundColor = [UIColor colorWithWhite:1.0f alpha:.8f];
        
        _teamLabel = [[UILabel alloc] init];
        _teamLabel.textAlignment = NSTextAlignmentCenter;
        _teamLabel.text = @"team. USAIU";
        _teamLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Light" size:40.0f];
        
        _meanLabel = [[UILabel alloc] init];
        _meanLabel.text = @"University of Seoul, Angel In Us";
        _meanLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:11.0f];
        _meanLabel.textColor = [UIColor lightGrayColor];
        
        _darrenLabel = [[UILabel alloc] init];
        _darrenLabel.textAlignment = NSTextAlignmentCenter;
        _darrenLabel.text = @"김 태 준 (korean.darren@gmail.com)";
        _darrenLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:15.0f];
        _darrenLabel.textColor = [UIColor darkGrayColor];
        
        _minjunLabel = [[UILabel alloc] init];
        _minjunLabel.textAlignment = NSTextAlignmentCenter;
        _minjunLabel.text = @"권 민 준 (Minz0000000@gmail.com)";
        _minjunLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:15.0f];
        _minjunLabel.textColor = [UIColor darkGrayColor];
        
        _darrenFace = [[UIImageView alloc] init];
        _darrenFace.image = [UIImage imageNamed:@"face02.jpg"];
        _darrenFace.contentMode = UIViewContentModeScaleAspectFill;
        _darrenFace.clipsToBounds = YES;
        
        _minjunFace = [[UIImageView alloc] init];
        _minjunFace.image = [UIImage imageNamed:@"face01.jpg"];
        _minjunFace.contentMode = UIViewContentModeScaleAspectFill;
        _minjunFace.clipsToBounds = YES;
        
        _ourFace = [[UIImageView alloc] init];
        _ourFace.image = [UIImage imageNamed:@"face03.jpg"];
        _ourFace.contentMode = UIViewContentModeScaleAspectFill;
        _ourFace.clipsToBounds = YES;
        
        [self.view addSubview:_ourFace];
        [self.view addSubview:_containerView];
//        [self.view addSubview:_teamLabel];
//        [self.view addSubview:_darrenLabel];
//        [self.view addSubview:_minjunLabel];
//        [self.view addSubview:_meanLabel];
        [_containerView addSubview:_teamLabel];
        [_containerView addSubview:_meanLabel];
        [_containerView addSubview:_darrenLabel];
        [_containerView addSubview:_minjunLabel];
        [self.view addSubview:_darrenFace];
        [self.view addSubview:_minjunFace];
        
        [_teamLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_containerView);
        }];
        
        [_meanLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_containerView);
            make.top.equalTo(_teamLabel.mas_bottom);
        }];
        
        [_darrenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_containerView);
            make.bottom.equalTo(_minjunLabel.mas_top).with.offset(-3.0f);
        }];
        
        [_minjunLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_containerView);
            make.bottom.equalTo(_containerView).with.offset(-10.0f);
        }];
        
        [_minjunFace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.and.right.equalTo(@0.0f);
            make.height.equalTo(@160.0f);
        }];
        
        [_darrenFace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(@.0f);
            make.bottom.equalTo(_minjunFace.mas_top);
            make.height.equalTo(@160.0f);
        }];
        
        [_ourFace mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.and.right.equalTo(@.0f);
            make.bottom.equalTo(_darrenFace.mas_top);
        }];
        
        [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_ourFace);
        }];
        
        _backButton = [[UIButton alloc] init];
        [_backButton setTitle:@"돌아가기" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        _backButton.titleLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:20.0f];
        [_backButton addTarget:self action:@selector(goBackToClock) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_backButton];
        
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@(-19.0f));
            make.top.equalTo(@(25));
        }];
        
        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(goBackToClock)];
        swipe.direction = UISwipeGestureRecognizerDirectionDown;
        [self.view addGestureRecognizer:swipe];
    }
    return self;
}

- (void)goBackToClock
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
