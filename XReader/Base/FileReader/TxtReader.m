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
        [self chapterseaprate];
    }
    return self;
}

- (void)chapterseaprate {
    NSError *error = NULL;
//    @"\\s{1}第(.{1,9})(章|节|集|卷|部|篇|回)"
    NSString *regexStr = @"\\s{1}第(.{1,9})(章|节|集|卷|部|篇|回)(\\s*)(.*)(\n|\r|\r\n)";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *matches = [regex matchesInString:_txtString options:0 range:NSMakeRange(0, _txtLength)];
    NSUInteger lastIdx = 0;
    
    NSMutableArray *titleArray = [NSMutableArray new];
    NSMutableArray *chapterArray = [NSMutableArray new];
    
    for (NSTextCheckingResult* match in matches) {
        NSRange range = match.range;
        if (range.location > lastIdx)
        {
            NSString *temp = [_txtString substringWithRange:NSMakeRange(lastIdx, range.location - lastIdx)];
            [chapterArray addObject:temp];
            lastIdx = range.location + 1;
            NSRange range = [temp rangeOfString:@"\\s{0}第(.{1,9})(章|节|集|卷|部|篇|回)(\\s*)(.*)" options:NSRegularExpressionSearch];
            if (range.location != NSNotFound) {
                NSString *title = [temp substringWithRange:range];
                [titleArray addObject:title];
            }
        }
    }
    self.titleArray = titleArray;
    self.chaperArray = chapterArray;
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
