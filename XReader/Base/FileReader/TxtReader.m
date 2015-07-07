//
//  TxtReader.m
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "TxtReader.h"

@interface TxtReader ()
@property (nonatomic,strong) NSFileHandle *fileHandle;
@end

@implementation TxtReader

- (instancetype)initWithFile:(NSString*)file {
    self = [super init];
    if (self) {
        _fileHandle = [NSFileHandle fileHandleForReadingAtPath:file];
    }
    return self;
}

- (NSString*)readFileWithRange:(NSRange)range {
    [_fileHandle seekToFileOffset:range.location];
    NSData *data = [_fileHandle readDataOfLength:range.length];
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return string;
}

- (void)dealloc {
    [_fileHandle closeFile];
}

@end
