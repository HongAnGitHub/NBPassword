//
//  NBBaseViewController.h
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <DDBaseProgressHUD/SVProgressHUD.h>

@interface NBBaseViewController : UIViewController

@property (nonatomic, copy) UILabel *titleLabel;

@property (nonatomic,strong) UIImageView *navbarAnimView;

/**
 打点来源
 */
@property (nonatomic,strong) NSMutableDictionary *logFromDictionary;

/**
 打点当前页面点击位置
 */
@property (nonatomic,strong) NSMutableDictionary *logToDictionary;

/**
 打点当前页面
 */
@property (nonatomic,strong) NSNumber *logCurrent;

/**
 打点页面操作
 */
@property (nonatomic,strong) NSNumber *logOperation;

/**
 打点参数信息
 */
@property (nonatomic,strong) NSMutableDictionary *logInfoDictionary;

/**
 是否需要Marginbottom
 */
@property (nonatomic,assign) BOOL isMinibarNeedsMarginBottom;

/**
 是否是全局播放器Appear的
 */
@property (nonatomic,assign) BOOL isPersentModelView;

//设置默认NAVBAR样式
- (void)setNavgationBarToBlack:(BOOL)isHiddenBottomLine;
//设置透明navbar样式
- (void)setNavgationBarToClear:(BOOL)isHiddenBottomLine;
//设置navbar透明度
- (void)setNavgationBarAlpha:(CGFloat)alpha isHiddenBottomLine:(BOOL)isHiddenBottomLine;
//设置黑线透明度
- (void)setNavgationBarBlackLineAlpha:(CGFloat)lineAlpha;


/**
 *  初始化加载View
 *
 *  @param fatherView  父View，一般来说是tableview
 */
- (void)initLoadingView:(UIView *)fatherView;
/**
 *  显示LoadingView动画
 */
- (void)showLoadingView;

/**
 *  隐藏LoadingView动画
 */
- (void)dismissLoadingView;

/**
 *  设置loadingView样式
 *
 *  @param style loadingView样式
 */
- (void)setLoadingViewStyle:(UIActivityIndicatorViewStyle)style;


/**
 设置距离顶部

 @param marginTop
 */
- (void)setLoadingViewMarginTop:(CGFloat)marginTop;


#pragma mark - Log Event
- (void)sendServerLogEvent:(NSNumber *)module tag:(NSNumber *)tag position:(NSNumber *)position;



@end
