//
//  PDCProxy.h
//  TestProxy
//
//  Created by pdc on 16/8/30.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDCProxy : NSProxy
/**
 *  weak proxy
 */
@property (nonatomic, weak ,readonly) id target;

/**
 *  Create a new weak proxy for target.
 *
 *  @param target weak proxy
 *
 *  @return instance
 */
+(instancetype )proxyWithTarget:(id )target;

-(instancetype )initWithTarget:(id )target;

@end
