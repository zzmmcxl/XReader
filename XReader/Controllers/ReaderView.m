//
//  ReaderView.m
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "ReaderView.h"

@interface ReaderView ()
@property (nonatomic,strong) UILabel *frontLabel;
@property (nonatomic,strong) UILabel *midLabel;
@property (nonatomic,strong) UILabel *nextLabel;
@end

@implementation ReaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        _frontLabel = [UILabel new];
        [self addSubview:_frontLabel];
        
        _midLabel = [UILabel new];
        [self addSubview:_midLabel];
        
        _nextLabel = [UILabel new];
        [self addSubview:_nextLabel];
        
        [_frontLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
        }];
        
        [_midLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_frontLabel);
            make.left.right.equalTo(self);
        }];
        
        [_nextLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_midLabel);
            make.left.right.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}

- (void)setWithPreStr:(NSString*)string {
    
}

- (void)setWithNextStr:(NSString*)string {
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
