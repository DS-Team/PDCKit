//
//  UIColor+PDCAdd.h
//  ColorAndImage
//
//  Created by KH on 16/7/19.
//  Copyright © 2016年 pdc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PDCAdd)

/**
 *  random rgb color
 *
 *  @return UIColor
 */
+(UIColor *)randomRGBColor;

/**
 *  random rgba color
 *
 *  @return UIColor
 */
+(UIColor *)randomRGBAColor;

/**
 *  color with rgba value
 *
 *  @param rgbaValue like 0x12345678
 *
 *  @return UIColor
 */
+(UIColor *)colorWithRGBA:(UInt32 )rgbaValue;

/**
 *  color with rgb calue
 *
 *  @param rgbValue like 0x123456
 *
 *  @return UIColor
 */
+(UIColor *)colorWithRGB:(UInt32 )rgbValue;

@end
