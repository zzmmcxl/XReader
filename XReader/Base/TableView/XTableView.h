//
//  XTableView.h
//  KDaijiaDriver
//
//  Created by zhuruhong on 15/4/13.
//  Copyright (c) 2015年 KDaijiaDriver. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XTableViewAdapter.h"

/**
 *  包装tableview，将datasource和delegate封装到adapter中
 *  将生成cell的逻辑拆分到adapter中，明确逻辑内容，减少文件中的代码长度
 */
@interface XTableView : UIView

@property (nonatomic, strong, readonly) UITableView *dataTableView;

- (void)setTableViewAdapter:(XTableViewAdapter *)tableViewAdapter;
- (void)refreshTableView;

@end
