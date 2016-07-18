//
//  UINavigationController+PDC.h
//  导航栏跳转测试
//
//  Created by KH on 16/1/21.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (PDC)
/** 返回几层控制器 */
-(void)popBackViewControllerCount:(NSInteger )backCount;

/** 返回第几层的控制器 */
-(UIViewController *)controllerByPopCount:(NSInteger )count;
@end
