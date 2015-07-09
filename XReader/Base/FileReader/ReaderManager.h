//
//  ReaderManager.h
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "TxtReader.h"

#define RM [ReaderManager sharedInstance]

@interface ReaderManager : NSObject

@property (nonatomic,strong) TxtReader *reader;

+ (instancetype)sharedInstance;
- (void)openBook:(Book*)book;
- (NSString*)getString;
- (NSString*)getPreString;
- (NSString*)getNextString;
@end
