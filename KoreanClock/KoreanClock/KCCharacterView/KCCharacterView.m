//
//  KCCharacterView.m
//  KoreanClock
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import "KCCharacterView.h"

// Library
#import <Masonry/Masonry.h>

@implementation KCCharacterView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _characterLabel = [[UILabel alloc] init];
        _characterLabel.textAlignment = NSTextAlignmentCenter;
        _characterLabel.textColor = [UIColor darkGrayColor];
        
        [self addSubview:_characterLabel];
        [self makeAutoLayoutConstraints];
    }
    return self;
}

- (void)makeAutoLayoutConstraints
{
    [_characterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

#pragma mark - Set

- (void)setStatus:(KCCharacterViewStatus)status
{
    _status = status;
    
    if (_status == KCCharacterViewStatusOff) {
        _characterLabel.textColor = [UIColor darkGrayColor];
    } else {
        _characterLabel.textColor = [UIColor whiteColor];
    }
}

@end
