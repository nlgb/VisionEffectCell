//
//  WSViewController.m
//  视觉差demo
//
//  Created by sw on 16/7/17.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSViewController.h"
#import "WSTableViewCell.h"

@interface WSViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak)UITableView *tableView;

@end

@implementation WSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//注意： 一定要是UIViewController，不能用UITableViewController
    [self setupUI];
}

#pragma mark - UI
- (void)setupUI {
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    self.tableView.rowHeight = 250.f;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WSTableViewCell *cell = [WSTableViewCell cellForTableView:tableView];
    cell.backImageView.image = [UIImage imageNamed:[@(indexPath.row + 1) stringValue]];
    return cell;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSArray *visibleCells = [self.tableView visibleCells];
    for (WSTableViewCell *cell in visibleCells) {
        [cell updateBackImageViewYForTableView:self.tableView andView:self.view];
    }
}

@end
