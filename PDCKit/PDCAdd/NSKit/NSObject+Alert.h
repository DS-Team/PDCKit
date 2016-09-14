//
//  NSObject+Alert.h
//  TestAlert
//
//  Created by pdc on 16/9/14.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

typedef void(^alert_action)(NSInteger index);

@interface NSObject (Alert)<UIAlertViewDelegate>
-(void )alertWithTitle:(NSString *)title
               message:(NSString *)message
               buttons:(NSArray <NSString *>*)buttons
              animated:(BOOL )animated
                action:(alert_action )alert_action;
@end
