//
//  NBHomePageViewController.m
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#import "NBHomePageViewController.h"

@interface NBHomePageViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UISearchBarDelegate
>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation NBHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customTitle = @"登录名";
    //    self.navigationItem.title = @"登录名";
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.searchBar];
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
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    cell.textLabel.text = @"这个动画自己加的 有点丑 可以调整";
    cell.detailTextLabel.text = @"搜索栏上移的时候 会出现表格灰色的背景色  改成白色就看不见了";
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

#pragma mark -- UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [UIView animateWithDuration:0.3 animations:^{
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        _searchBar.frame = CGRectMake(0, 20, SCREEN_WIDTH, 44);
        _searchBar.showsCancelButton = YES;
    }];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [UIView animateWithDuration:0.3 animations:^{
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        _searchBar.frame = CGRectMake(0, 64, SCREEN_WIDTH, 44);
        _searchBar.showsCancelButton = NO;
    }];
    [_searchBar resignFirstResponder];
}


#pragma mark -- Lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStyleGrouped];
        /*   搜索栏上移的时候 会出现表格灰色的背景色  改成白色就看不见了  */
//        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UISearchBar *)searchBar
{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"这个是search + tableView";
        _searchBar.showsCancelButton = NO;
        [_searchBar sizeToFit];
    }
    return _searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
