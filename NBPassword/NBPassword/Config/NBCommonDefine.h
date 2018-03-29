//
//  NBCommonDefine.h
//  NBPassword
//
//  Created by SBD on 2018/3/28.
//  Copyright © 2018年 An. All rights reserved.
//

#ifndef NBCommonDefine_h
#define NBCommonDefine_h

//screenSize
#define Screen [[UIScreen mainScreen] bounds]
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

#define WidthScale(number) ([UIScreen mainScreen].bounds.size.width/375.0*(number))
#define HeightScale(number) ([UIScreen mainScreen].bounds.size.height/667.0*(number))

// Color
#define NBAppMainColor [UIColor NBPasswordColorWithString:@"A3ADB6"];

#define FONT_SIZE(a) [UIFont fontWithName:@"PingFangSC-Light" size:WidthScale(a)]



#endif /* NBCommonDefine_h */
