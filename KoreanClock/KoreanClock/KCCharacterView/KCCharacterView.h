//
//  KCCharacterView.h
//  KoreanClock
//
//  Created by 1001246 on 2015. 5. 4..
//  Copyright (c) 2015년 USAIU. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, KCCharacterViewStatus) {
    KCCharacterViewStatusOff,
    KCCharacterViewStatusOn
};

@interface KCCharacterView : UIView

@property (nonatomic) KCCharacterViewStatus status;

@property (strong, nonatomic) NSString *character;
@property (strong, nonatomic) UILabel *characterLabel;

- (instancetype)init;
- (instancetype)initWithCharacter:(NSString *)character;

@end