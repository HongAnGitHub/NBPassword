//
//  NBCollectViewController.m
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#import "NBCollectViewController.h"

@interface NBCollectViewController ()
<
UISearchResultsUpdating,
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation NBCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customTitle = @"收藏";
    [self.view addSubview:self.tableView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"AccountCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    cell.textLabel.text = @"鸿安最帅";
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}


#pragma mark - UISearchDelegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {

}

#pragma mark -- Lazy
- (UISearchController *)searchController {
    if (!_searchController) {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        _searchController.hidesNavigationBarDuringPresentation = YES;
        _searchController.searchBar.placeholder = @"searchController + tableView";
        [_searchController.searchBar sizeToFit];
    }
    return _searchController;
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView setTableHeaderView:self.searchController.searchBar];
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
