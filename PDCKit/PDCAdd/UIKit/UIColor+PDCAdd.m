//
//  UIColor+PDCAdd.m
//  ColorAndImage
//
//  Created by KH on 16/7/19.
//  Copyright © 2016年 pdc. All rights reserved.
//

#import "UIColor+PDCAdd.h"

@implementation UIColor (PDCAdd)
+(UIColor *)randomRGBColor
{
    return [UIColor colorWithRGB:arc4random_uniform(0xffffff)];
}

+(UIColor *)randomRGBAColor
{
    return [UIColor colorWithRGBA:arc4random_uniform(0xffffffff)];
}

+(UIColor *)colorWithRGBA:(UInt32 )rgbaValue
{
    return [UIColor colorWithRed:((rgbaValue & 0xff000000) >> 24) / 255.0f
                           green:((rgbaValue & 0xff0000) >> 16) / 255.0f
                            blue:((rgbaValue & 0xff00) >> 8) / 255.0f
                           alpha:(rgbaValue & 0xff) / 255.0f];
}

+(UIColor *)colorWithRGB:(UInt32 )rgbValue
{
    return [UIColor colorWithRed:((rgbValue & 0xff0000) >> 16) / 255.0f
                           green:((rgbValue & 0xff00) >> 8) / 255.0f
                            blue:(rgbValue & 0xff) / 255.0f
                           alpha:1.0f];
}
@end
