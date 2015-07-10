//
//  ReaderAdapter.m
//  XReader
//
//  Created by 徐传勇 on 15/7/9.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "ReaderAdapter.h"
#import "ReaderView.h"

@interface ReaderAdapter ()

@property (nonatomic,strong) ReaderViewCell *cell;

@end

@implementation ReaderAdapter

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReaderViewCell *cell = REUSED_CELL(tableView, ReaderViewCell);
    [cell setWithData:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.cell) {
        _cell = [[ReaderViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"forHeight"];
    }
    [_cell setWithData:[self.dataArray objectAtIndex:indexPath.row]];
    [_cell layoutIfNeeded];
    CGFloat height = [_cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    return height;
}

@end
