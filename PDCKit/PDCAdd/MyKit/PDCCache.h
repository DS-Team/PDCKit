//
//  PDCCache.h
//  PDCCache
//
//  Created by pdc on 16/8/25.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  cache in memory
 */
@interface PDCCache : NSObject
/**
 *  switch by Name
 *
 *  @param name nil is default,other is custom
 */
+(void )switchCacheByName:(NSString *)name;


+(void )setObject:(id )obj forKey:(NSString *)key;
+(id )objectForKey:(NSString *)key;
+(void )removeObjectForKey:(NSString *)key;
+(void )removeAllObject;
@end
