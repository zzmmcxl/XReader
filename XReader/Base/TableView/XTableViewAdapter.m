//
//  XTableViewAdapter.m
//  KDaijiaDriver
//
//  Created by zhuruhong on 15/4/13.
//  Copyright (c) 2015年 KDaijiaDriver. All rights reserved.
//

#import "XTableViewAdapter.h"

@implementation XTableViewAdapter

- (instancetype)init
{
    if (self = [super init]) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView*)tableView reusedCellOfClass:(Class)class
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(class)];
    if (!cell)
        cell = [[class alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(class)];
    return cell;
}

- (UITableViewHeaderFooterView *)tableView:(UITableView*)tableView reusedHeaderFooterViewOfClass:(Class)class {
    UITableViewHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(class)];
    if (!view) {
        view = [[class alloc] initWithReuseIdentifier:NSStringFromClass(class)];
    }
    return view;
}

#pragma mark -
#pragma mark UITableViewDataSource method

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self tableView:tableView cellForNone:indexPath];
}

// 默认空白cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForNone:(NSIndexPath *)indexPath
{
    return REUSED_CELL(tableView, UITableViewCell);
}

#pragma mark -
#pragma mark UITableViewDelegate method

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if (indexPath.row >= _dataArray.count) {
        return;
    }
    
    if (_delegate && [_delegate respondsToSelector:@selector(didTableViewCellSelected:)]) {
        id cellData = _dataArray[indexPath.row];
        [_delegate didTableViewCellSelected:cellData];
    }
}

@end
