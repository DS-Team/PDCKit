//
//  NSTimer+PDCAdd.h
//  PDCKit
//
//  Created by KH on 16/6/17.
//  Copyright © 2016年 KH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDCQueueFunction.h"
/** --------------------------------
 *
 *  这里的timer都是异步的timer
 *
 * ---------------------------------*/
@interface NSTimer (PDCAdd)
/* sleep下的timer */
+(void )sleep_scheduledTimerWithTimerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action;

/* runloop timer */
+(void )runloop_scheduledTimerWithTimerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action;

/* 这个只能创建一个timer */
+(void )gcd_scheduledTimerWithTimerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action;

+(void )gcd_scheduledTimerWithSource:(dispatch_source_t )source timerInterval:(NSTimeInterval )interval repeat:(BOOL )repeat action:(void (^)(BOOL *stop)) action end:(void (^)(dispatch_source_t source)) end;

/* 这个也算是一个定时器，基于runloop */
PDC_FUNTION_EXTERN void gcd_asynSerialQueue(NSTimeInterval block_next_time, pdc_block_bool block);
@end
