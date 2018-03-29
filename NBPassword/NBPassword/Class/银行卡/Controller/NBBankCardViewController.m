//
//  NBBankCardViewController.m
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#import "NBBankCardViewController.h"

@interface NBBankCardViewController ()
<
UISearchResultsUpdating,
UITableViewDataSource,
UITableViewDelegate
>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UIView *searchView;

@end

@implementation NBBankCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customTitle = @"银行卡";
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.searchView];

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
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)searchView
{
    if (!_searchView) {
        _searchView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 44)];
        [_searchView addSubview:self.searchController.searchBar];
    }
    return _searchView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
