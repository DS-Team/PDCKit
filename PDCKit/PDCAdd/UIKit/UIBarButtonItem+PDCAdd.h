//
//  UIBarButtonItem+PDCAdd.h
//  ColorAndImage
//
//  Created by KH on 16/7/19.
//  Copyright © 2016年 pdc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (PDCAdd)
/**
 *  get item with title
 *
 *  @param title  title
 *  @param action callback
 *
 *  @return UIBarButtonItem instance
 */
+(instancetype )itemWithTitle:(NSString *)title action:(void(^)() )action;

/**
 *  get item with image
 *
 *  @param image  image
 *  @param action callback
 *
 *  @return UIBarButtonItem instance
 */
+(instancetype )itemWithImage:(UIImage *)image action:(void(^)() )action;

/**
 *  get item with UIBarButtonSystemItem
 *
 *  @param systemItem UIBarButtonSystemItem
 *  @param action     callback
 *
 *  @return UIBarButtonItem instance
 */
+(instancetype )itemWithSystemItem:(UIBarButtonSystemItem)systemItem action:(void(^)() )action;

@end
