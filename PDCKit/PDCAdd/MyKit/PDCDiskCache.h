//
//  PDCCache.h
//  PDCCache
//
//  Created by pdc on 16/8/20.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDCDiskCache : NSObject
+(void )diskCacheWithPath:(NSString *)path;
+(void )diskCacheWithName:(NSString *)name;

+(NSData *)dataWithKey:(NSString *)key;
+(BOOL )writeData:(NSData *)data withKey:(NSString *)key;
+(BOOL )writeData:(NSData *)data withKey:(NSString *)key andUpdate:(BOOL )update;
+(BOOL )existKey:(NSString *)key;

+(void )clearDataWithKey:(NSString *)key;
+(void )clearAllData;
@end
