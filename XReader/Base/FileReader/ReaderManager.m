//
//  ReaderManager.m
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "ReaderManager.h"

@implementation ReaderManager

- (void)openBook:(Book*)book {
    self.reader = [[TxtReader alloc] initWithFile:book.fileUrl];
    
}

@end
