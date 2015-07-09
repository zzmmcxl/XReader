//
//  ReaderViewController.m
//  XReader
//
//  Created by 徐传勇 on 15/7/7.
//  Copyright (c) 2015年 传勇徐. All rights reserved.
//

#import "ReaderViewController.h"
#import "ReaderView.h"
#import "ReaderAdapter.h"

@interface ReaderViewController () <XTableViewAdapterDelegate>
@property (nonatomic,strong) ReaderView *readerView;
@property (nonatomic,strong) ReaderAdapter *readerAdapter;

@end

@implementation ReaderViewController

- (void)loadView {
    _readerView = [ReaderView new];
    self.view = _readerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _readerAdapter = [ReaderAdapter new];
    _readerAdapter.delegate = self;
    [_readerView setTableViewAdapter:_readerAdapter];
    
    Book *book = [Book new];
    book.fileUrl = [[NSBundle mainBundle] pathForResource:@"择天记" ofType:@"txt"];
    [RM openBook:book];
//    [_readerView setWithStr:[RM getString]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
