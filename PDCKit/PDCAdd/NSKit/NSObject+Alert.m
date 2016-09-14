//
//  NSObject+Alert.m
//  TestAlert
//
//  Created by pdc on 16/9/14.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import "NSObject+Alert.h"
#ifndef __IPHONE_8_0
#import <objc/runtime.h>
#endif

@implementation NSObject (Alert)
-(void )alertWithTitle:(NSString *)title
               message:(NSString *)message
               buttons:(NSArray <NSString *>*)buttons
              animated:(BOOL )animated
                action:(alert_action )alert_action
{
#if __IPHONE_8_0
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        [buttons enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:idx?UIAlertActionStyleDefault:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                alert_action(idx);
            }];
            [alertController addAction:action];
        }];
        
        [[self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController] presentViewController:alertController animated:animated completion:nil];
    }
#else
    if ([[UIDevice currentDevice].systemVersion floatValue] <= 7.0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
        [buttons enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [alertView addButtonWithTitle:obj];
            [alertView dismissWithClickedButtonIndex:idx animated:animated];
        }];
        if (buttons.count > 0)
        {
            [self setAction:alert_action];
        }
        [alertView show];
    }
#endif
}

#ifndef __IPHONE_8_0
-(void )setAction:(alert_action )alert_action
{
    objc_setAssociatedObject(self, @selector(alert_action), alert_action, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

-(alert_action )alert_action
{
    return objc_getAssociatedObject(self, _cmd);
}

#pragma mark - alertView delegate
-(void )alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self alert_action](buttonIndex);
}
#endif

/** 获取当前界面的ViewController */
-(UIViewController *)topViewControllerWithRootViewController:(UIViewController *)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    }
    else if ([rootViewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *nav = (UINavigationController *)rootViewController;
        return [self topViewControllerWithRootViewController:nav.visibleViewController];
    }
    else if (rootViewController.presentedViewController)
    {
        UIViewController *presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    }
    else
    {
        return rootViewController;
    }
}
@end
