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

#pragma mark - Initialize

- (void)initialize
{
    _characterLabel = [[UILabel alloc] init];
    _characterLabel.textAlignment = NSTextAlignmentCenter;
    _characterLabel.textColor = [UIColor darkGrayColor];
    _characterLabel.font = [UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:30];
    
    [self addSubview:_characterLabel];
    [self makeAutoLayoutConstraints];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithCharacter:(NSString *)character
{
    self = [super init];
    if (self) {
        [self initialize];
        _character = character;
        _characterLabel.text = _character;
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
