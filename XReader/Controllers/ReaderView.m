//
//  ReaderView.m
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "ReaderView.h"

@interface ReaderView ()
@property (nonatomic,strong) UILabel *textLabel;
@end

@implementation ReaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        _textLabel = [UILabel new];
        [self addSubview:_textLabel];

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
