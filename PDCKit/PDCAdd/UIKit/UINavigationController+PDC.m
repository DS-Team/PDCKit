//
//  UINavigationController+PDC.m
//  导航栏跳转测试
//
//  Created by KH on 16/1/21.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UINavigationController+PDC.h"


@implementation UINavigationController (PDC)

-(void)popBackViewControllerCount:(NSInteger )backCount
{
    UIViewController *vc = [self controllerByPopCount:backCount];
    if (vc != nil)
    {
        [self popToViewController:vc animated:YES];
    }
}

-(UIViewController *)controllerByPopCount:(NSInteger )count
{
    __block UIViewController *vc = nil;
    NSInteger totalCount = self.viewControllers.count;
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (totalCount - 1 - idx == count)
        {
            vc = obj;
            *stop = YES;
        }
    }];
    return vc;
}
@end
