//
//  TxtReader.m
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "TxtReader.h"

@interface TxtReader ()
@property (nonatomic,strong) NSString *txtString;
@property (nonatomic,assign) NSInteger  txtLength;
@end

@implementation TxtReader

- (instancetype)initWithFile:(NSString*)file {
    self = [super init];
    if (self) {
        _txtString = [[NSString alloc] initWithContentsOfFile:file encoding:NSUTF8StringEncoding error:nil];
        _txtLength = [_txtString length];
        self.chaperArray = [self chapterseaprate];
    }
    return self;
}

- (NSArray*)chapterseaprate {
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(^//s*第)(.{1,9})[章节卷集部篇回](//s*)(.*)" options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:_txtString options:0 range:NSMakeRange(0, _txtLength)];
    NSUInteger lastIdx = 0;
    
    NSMutableArray *chapterArray = [NSMutableArray new];
    
    for (NSTextCheckingResult* match in matches) {
        NSRange range = match.range;
        if (range.location > lastIdx)
        {
            NSString *temp = [_txtString substringWithRange:NSMakeRange(lastIdx, range.location - lastIdx)];
            [chapterArray addObject:temp];
        }
    }
    return chapterArray;
}

- (NSString*)readFileWithRange:(NSRange)range {
    if (range.location > _txtLength) {
        return nil;
    }
    
    if (range.location + range.length > _txtLength) {
        range.length = _txtLength - range.location;
    }

    return [_txtString substringWithRange:range];
}

- (void)dealloc {

}

@end
