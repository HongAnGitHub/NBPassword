//
//  UIButton+EnlargeTouchArea.h
//  SuiBianDa
//
//  Created by 矫鸿安 on 2017/9/30.
//  Copyright © 2017年 Hongan_J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIButton (EnlargeTouchArea)
/*
 扩大按钮点击区域
 */
- (void)setEnlargeEdgeWithTop:(CGFloat) top right:(CGFloat) right bottom:(CGFloat) bottom left:(CGFloat) left;

@end
