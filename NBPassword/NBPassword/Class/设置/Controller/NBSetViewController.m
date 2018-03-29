//
//  NBSetViewController.m
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#import "NBSetViewController.h"
#import "JHAViewController.h"

@interface NBSetViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation NBSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.customTitle = @"设置";
//    self.navigationItem.title = @"设置";
    self.dataArray = @[
                       @{@"安全":@[@"启用Touch ID",@"清空剪切板",@"修改主密码",@"入侵拍照"]},
                       @{@"备份":@[@"备份到iCloud",@"从iCloud恢复",@"自动备份"]},
                       @{@"高级":@[@"升级到专业版",@"恢复购买",@"更换皮肤"]},
                       @{@"关于":@[@"意见反馈",@"使用说明",@"版本：v1.0"]},
                       ];
    
    [self.view addSubview:self.tableView];
}

#pragma mark -- UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_dataArray[section] allValues][0] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"SETCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    }
    cell.textLabel.text = [_dataArray[indexPath.section] allValues][0][indexPath.row];
    return cell;
}

#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == _dataArray.count-1) {
        return 60;
    }else{
        return 0.1;
    }
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
   
    UILabel *headerLabel = [[UILabel alloc]init];
    headerLabel.font = [UIFont systemFontOfSize:15];
    headerLabel.textColor = [UIColor darkGrayColor];
    headerLabel.text = [_dataArray[section] allKeys][0];
    [view addSubview:headerLabel];
    [headerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).offset(10);
        make.centerY.equalTo(view.mas_centerY);
    }];
    
    return view;
}
    
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == _dataArray.count-1) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        
        UILabel *footerLabel = [[UILabel alloc]init];
        footerLabel.font = [UIFont systemFontOfSize:16];
        footerLabel.text = @"NBPasswords v1.0";
        footerLabel.textColor = [UIColor NBPasswordColorWithString:@"A3ADB6"];
        footerLabel.center = view.center;
        [view addSubview:footerLabel];
        [footerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(view.mas_centerX);
            make.centerY.equalTo(view.mas_centerY);
        }];
        return view;
    }else{
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JHAViewController *vc = [[JHAViewController alloc] init];
//    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -- Lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
