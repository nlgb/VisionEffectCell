//
//  WSTableViewController.m
//  视觉差demo
//
//  Created by sw on 16/7/17.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSTableViewController.h"
#import "WSTableViewCell.h"

@interface WSTableViewController ()

@end

@implementation WSTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 200.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:[UIScrollView new]];
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
