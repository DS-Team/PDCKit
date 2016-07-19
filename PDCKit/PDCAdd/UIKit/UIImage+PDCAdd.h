//
//  UIImage+PDCAdd.h
//  ColorAndImage
//
//  Created by KH on 16/7/19.
//  Copyright © 2016年 pdc. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  need ImageIO.framework
 */

@interface UIImage (PDCAdd)
/**
 *  get image with color
 *
 *  @param color image color
 *  @param size  image size
 *
 *  @return UIImage
 */
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize )size;

/**
 *  get image with rgb value
 *
 *  @param rgbValue rgb value like 0x123456
 *  @param size     image size
 *
 *  @return UIImage
 */
+(UIImage *)imageWithRGBValue:(UInt32 )rgbValue size:(CGSize )size;

/**
 *  get image with rgba value
 *
 *  @param rgbaValue rgba value like 0x12345678
 *  @param size      image size
 *
 *  @return UIImage
 */
+(UIImage *)imageWithRGBAValue:(UInt32 )rgbaValue size:(CGSize )size;

/**
 *  get animation image with gif file name
 *
 *  @param name gif file name
 *
 *  @return animation image
 */
+(UIImage *)imageWithGIFName:(NSString *)name;

/**
 *  get animation image with gif file name and set custom duration
 *
 *  @param name     gif file name
 *  @param duration custom set
 *
 *  @return animation image
 */
+(UIImage *)imageWithGIFName:(NSString *)name duration:(NSNumber *)duration;
@end
