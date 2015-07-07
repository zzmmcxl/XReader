//
//  XTableViewAdapter.h
//  KDaijiaDriver
//
//  Created by zhuruhong on 15/4/13.
//  Copyright (c) 2015年 KDaijiaDriver. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define REUSED_CELL(tableView,cellClass) (cellClass *)[self tableView:tableView reusedCellOfClass:([cellClass class])]

#define REUSED_HEADERFOOTER(table,viewClass) (viewClass *)[self tableView:tableView reusedHeaderFooterViewOfClass:([viewClass class])]

@protocol XTableViewAdapterDelegate <NSObject>

@optional

- (void)didTableViewCellSelected:(id)aCellData;

@end

/**
 *  将datasource和delegate封装到adapter中
 *  独立出tableview的展示逻辑
 */
@interface XTableViewAdapter : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, weak) id<XTableViewAdapterDelegate> delegate;

- (UITableViewCell *)tableView:(UITableView*)tableView reusedCellOfClass:(Class)class;

- (UITableViewHeaderFooterView *)tableView:(UITableView*)tableView reusedHeaderFooterViewOfClass:(Class)class;

@end
