//
//  NBTabBarController.m
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#import "NBTabBarController.h"
#import "NBBaseNavigationController.h"

#import "NBCollectViewController.h"
#import "NBHomePageViewController.h"
#import "NBBankCardViewController.h"
#import "NBSetViewController.h"

@interface NBTabBarController ()

@end

@implementation NBTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addViewControllers];
}

- (void)addViewControllers{
    
    // 收藏
    NBCollectViewController *collectVC = [[NBCollectViewController alloc] init];
    NBBaseNavigationController *collectNav = [[NBBaseNavigationController alloc] initWithRootViewController:collectVC];
    [self addChildViewController:collectNav title:@"收藏" imageName:@"" selectedImageName:@""];
    
    // 密码
    NBHomePageViewController *homeVC = [[NBHomePageViewController alloc] init];
    NBBaseNavigationController *homeNav = [[NBBaseNavigationController alloc] initWithRootViewController:homeVC];
    [self addChildViewController:homeNav title:@"密码" imageName:@"" selectedImageName:@""];
    
    // 银行卡
    NBBankCardViewController *bankCardVC = [[NBBankCardViewController alloc] init];
    NBBaseNavigationController *bankCardNav = [[NBBaseNavigationController alloc] initWithRootViewController:bankCardVC];
    [self addChildViewController:bankCardNav title:@"银行卡" imageName:@"" selectedImageName:@""];
    
    //设置
    NBSetViewController *setVC = [[NBSetViewController alloc] init];
    NBBaseNavigationController *setNav = [[NBBaseNavigationController alloc] initWithRootViewController:setVC];
    [self addChildViewController:setNav title:@"设置" imageName:@"" selectedImageName:@""];
}

//  添加子控制器到Tabbar
-(void)addChildViewController:(UINavigationController *)childNav title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    //设置选项卡的标题
    childNav.tabBarItem.title = title;
    
    //设置标题选中颜色
    self.tabBar.tintColor = [UIColor grayColor];
    
    //设置图片
    childNav.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    
    ///< 不使用系统颜色
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childNav.tabBarItem.selectedImage = selectedImage;
    
    // 添加控制器到TabBarController
    [self addChildViewController:childNav];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
