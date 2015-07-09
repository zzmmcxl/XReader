//
//  ReaderManager.m
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "ReaderManager.h"

#define Default_Length 5000

@interface ReaderManager ()
@property (nonatomic,strong) Book *book;
@property (nonatomic,assign) NSInteger location;
@end

@implementation ReaderManager

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)openBook:(Book*)book {
    _book = book;
    _reader = [[TxtReader alloc] initWithFile:book.fileUrl];
    NSNumber *location = [[NSUserDefaults standardUserDefaults] valueForKey:[_book.fileUrl lastPathComponent]];
    _location = [location integerValue];
}

- (NSString*)getString {
    return [_reader readFileWithRange:NSMakeRange(_location, Default_Length)];
}

- (NSString*)getPreString {
    NSInteger location = 0;
    NSInteger length = 0;
    if (_location < Default_Length) {
        location = 0;
        length = _location;
    }
    else {
        location = _location - Default_Length;
        length = Default_Length;
    }
    _location = location;
    return [_reader readFileWithRange:NSMakeRange(location, length)];
}

- (NSString*)getNextString {
    _location = _location + Default_Length;
    return [_reader readFileWithRange:NSMakeRange(_location, Default_Length)];
}

@end
