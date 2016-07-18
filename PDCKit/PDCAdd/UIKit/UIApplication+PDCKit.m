//
//  UIApplication+PDCKit.m
//  Client
//
//  Created by KH on 16/6/2.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UIApplication+PDCKit.h"

@implementation UIApplication (PDCKit)
-(void )callThisPhoneNumber:(NSString *)phoneNnumber
{
    [self openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",phoneNnumber]]];
}
@end
