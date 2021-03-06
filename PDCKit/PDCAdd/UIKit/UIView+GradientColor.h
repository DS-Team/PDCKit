//
//  UIView+GradientColor.h
//  渐变色
//
//  Created by KH on 16/7/11.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>
#define DefaultTypeIfCustomColors 250

typedef NS_ENUM(NSInteger,GradientColorEnumType)
{
    DefaultType = 0,
    TopToDown = DefaultType,
    DownToTop,
    LeftToRight,
    RightToLeft,
    TopLeftToDownRight,
    TopRightToDownLeft,
    DownRightToTopLeft,
    DownLeftToTopRight,
    
    CenterToLeftRight = DefaultTypeIfCustomColors,
    CenterToTopDown,
    LeftRightToCenter,
    TopDownToCenter
};

@interface UIView (GradientColor)
//默认渐变到的颜色，默认为白色
@property (strong, nonatomic) UIColor *defaultColor;

//渐变类型
@property (nonatomic, assign) GradientColorEnumType gradientType;

//渐变颜色
@property (strong, nonatomic) UIColor *gradientColor;

//自定义颜色数组
@property (strong, nonatomic) NSArray<UIColor *> *customGradientColors;


//gradientLayer
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end
