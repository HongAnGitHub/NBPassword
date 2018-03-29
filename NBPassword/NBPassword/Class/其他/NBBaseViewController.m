//
//  NBBaseViewController.m
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#import "NBBaseViewController.h"
#import "UINavigationBar+Awesome.h"

#define RIGHT_BAR_TAG 1942

@interface NBBaseViewController (){
    UIActivityIndicatorView *detailLoadingView;
}
@end

@implementation NBBaseViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//
//
//}
#pragma mark - life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


/**
 *  页面即将出现
 *
 *  @param animated 动画
 */
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


/**
 *  页面即将消失
 *
 *  @param animated 动画
 */
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

/**
 *  释放
 */
//-(void)dealloc{
//    [SVProgressHUD dismiss];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.modalPresentationCapturesStatusBarAppearance = NO;
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 44)];
    _titleLabel.font = FONT_SIZE(16);
    _titleLabel.textColor = [UIColor NBPasswordColorWithString:@"606069"];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = _titleLabel;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private Methods


/**
 *  初始化加载View
 *
 *  @param fatherView  父View，一般来说是tableview
 */
- (void)initLoadingView:(UIView *)fatherView{
    
    detailLoadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [detailLoadingView setHidesWhenStopped:YES];
    [fatherView addSubview:detailLoadingView];
    __weak UIView *view = fatherView;
    CGFloat marginCenterY = 64.f;
    if ([UIScreen mainScreen].bounds.size.height == 812) {
        marginCenterY = 88.f;
    }
    [detailLoadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.centerY.equalTo(view).offset(-marginCenterY);
    }];
    
}


/**
 *  显示LoadingView动画
 */
- (void)showLoadingView{
    
    if (detailLoadingView != nil) {
        [detailLoadingView startAnimating];
    }
}


/**
 *  隐藏LoadingView动画
 */
- (void)dismissLoadingView{
    
    if (detailLoadingView != nil) {
        [detailLoadingView stopAnimating];
    }
}

/**
 *  设置loadingView样式
 *
 *  @param style loadingView样式
 */
- (void)setLoadingViewStyle:(UIActivityIndicatorViewStyle)style {
    
    if (detailLoadingView != nil) {
        detailLoadingView.activityIndicatorViewStyle = style;
    }
    
}


/**
 设置LoadingView距离中心位置
 
 @param marginTop 距离顶部距离
 */
- (void)setLoadingViewMarginTop:(CGFloat)marginTop{
    
    if (detailLoadingView != nil && [detailLoadingView superview]) {
        __weak UIView *view = [detailLoadingView superview];
        CGFloat marginCenterY = 64.f;
        if ([UIScreen mainScreen].bounds.size.height == 812) {
            marginCenterY = 88.f;
        }
        [detailLoadingView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(view);
            make.centerY.equalTo(view).offset(-marginCenterY + marginTop);
        }];
    }
    
}


#pragma mark - getters and setters

/**
 *  允许横竖屏
 *
 *  @return 是否允许横竖屏
 */
- (BOOL)shouldAutorotate
{
    return YES;
}

/**
 *  只支持竖屏
 *
 *  @return 是否只支持竖屏
 */
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        return  UIInterfaceOrientationMaskAll;
    }else{
        return UIInterfaceOrientationMaskPortrait;
    }
}

#pragma mark - 设置navbar样式


/**
 *  重设NAVBAR样式
 */
- (void)setNavgationBarToBlack:(BOOL)isHiddenBottomLine{
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    //设置NAV样式
    [self.navigationController.navigationBar setTintColor:[UIColor colorWithRed:153.f/255.f green:153.f/255.f blue:153.f/255.f alpha:1.f]];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self setNavgationBarBlackLineAlpha:(isHiddenBottomLine ? 0.f : 1.f)];
    
    NSMutableDictionary *textAttributes = [[NSMutableDictionary alloc] initWithCapacity:2];
    [textAttributes setValue:[UIColor blackColor] forKey:NSForegroundColorAttributeName];
    [textAttributes setValue:[UIFont boldSystemFontOfSize:17] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:NO];
    
}

/**
 *  设置白色NAVBAR样式
 */
- (void)setNavgationBarToClear:(BOOL)isHiddenBottomLine{
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar lt_setBackgroundColor:[UIColor clearColor]];
    
    [self setNavgationBarBlackLineAlpha:(isHiddenBottomLine ? 0.f : 1.f)];
    NSMutableDictionary *textAttributes = [[NSMutableDictionary alloc] initWithCapacity:2];
    [textAttributes setValue:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [textAttributes setValue:[UIFont boldSystemFontOfSize:17] forKey:NSFontAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:textAttributes];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    
}


/**
 设置navbar的透明度
 
 @param alpha 透明度
 */
- (void)setNavgationBarAlpha:(CGFloat)alpha isHiddenBottomLine:(BOOL)isHiddenBottomLine{
    
    UIColor *color = [UIColor whiteColor];
    [self.navigationController.navigationBar lt_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    
    [self setNavgationBarBlackLineAlpha:alpha];
}


/**
 设置黑线透明度
 
 @param lineAlpha 透明度
 */
- (void)setNavgationBarBlackLineAlpha:(CGFloat)lineAlpha{
    
    UIImageView *navigationbarLineView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
    if (navigationbarLineView) {
        [navigationbarLineView setHidden:YES];
    }
    
}


/**
 Findnavbar的线
 
 @param view 线
 @return 线的图片
 */
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0){
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


#pragma mark - apply iOS 11


/**
 返回自定义UIBarButtonItem
 
 @param target 由实现着决定，target
 @param action 由实现着决定，action
 @return 返回
 */
- (UIBarButtonItem *)rt_customBackItemWithTarget:(id)target action:(SEL)action{
    NSBundle *bundle = [NSBundle bundleForClass:[NBBaseViewController class]];
    UIImage *returnsImage = [UIImage imageNamed:@"ddglobal_return_button" inBundle:bundle compatibleWithTraitCollection:nil];
    if (returnsImage) {
        UIBarButtonItem *customBarButton = [[UIBarButtonItem alloc] initWithImage:returnsImage style:UIBarButtonItemStylePlain target:target action:action];
        return customBarButton;
    }else{
        UIBarButtonItem *customBarButton = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:target action:action];
        return customBarButton;
    }
}


#pragma mark - Log Event


/**
 设置服务器打点
 
 @param module 打点模型
 @param tag 打点Tag
 @param position 打点位置
 */
- (void)sendServerLogEvent:(NSNumber *)module tag:(NSNumber *)tag position:(NSNumber *)position{
    
    
}
@end
