//
//  XTableView.m
//  KDaijiaDriver
//
//  Created by zhuruhong on 15/4/13.
//  Copyright (c) 2015年 KDaijiaDriver. All rights reserved.
//

#import "XTableView.h"

@implementation XTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        _dataTableView = [[UITableView alloc] initWithFrame:self.bounds];
        _dataTableView.backgroundColor = [UIColor clearColor];
        _dataTableView.separatorColor = [UIColor lightGrayColor];
        _dataTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:_dataTableView];
    }
    return self;
}

- (void)setTableViewAdapter:(XTableViewAdapter *)tableViewAdapter
{
    _dataTableView.delegate = tableViewAdapter;
    _dataTableView.dataSource = tableViewAdapter;
}

- (void)refreshTableView
{
    [_dataTableView reloadData];
}

- (void)dealloc
{
    _dataTableView.delegate = nil;
    _dataTableView.dataSource = nil;
    _dataTableView = nil;
}

@end
