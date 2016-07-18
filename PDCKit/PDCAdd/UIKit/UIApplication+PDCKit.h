//
//  UIApplication+PDCKit.h
//  Client
//
//  Created by KH on 16/6/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (PDCKit)

/**
 *  打电话
 *
 *  @param phoneNnumber 电话号码
 */
-(void )callThisPhoneNumber:(NSString *)phoneNnumber;
@end
