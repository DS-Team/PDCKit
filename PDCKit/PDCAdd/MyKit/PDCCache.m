//
//  PDCCache.m
//  PDCCache
//
//  Created by pdc on 16/8/25.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import "PDCCache.h"
@class _PDCCache;
static _PDCCache *_pdcCache;
static NSString *const kDefaultkey = @"_PDCDefaultKey_";
static NSString *key_name;

@interface _PDCCache : NSObject
@property (nonatomic, strong) NSMutableDictionary<NSString *, NSCache *> *dict;

@end

@implementation _PDCCache
+(instancetype )defalutCache
{
    if (_pdcCache == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _pdcCache = [_PDCCache new];
            _pdcCache.dict = [@{kDefaultkey:[NSCache new]} mutableCopy];
            if (key_name)
            {
                [_PDCCache addKeyName:key_name];
            }
        });
    }
    return _pdcCache;
}

+(void )addKeyName:(NSString *)keyName
{
    if (![[_PDCCache defalutCache].dict objectForKey:keyName])
    {
        [[_PDCCache defalutCache].dict setObject:[NSCache new] forKey:keyName];
    }
}

+(NSCache *)cache
{
    if (key_name != nil)
    {
        return [_PDCCache defalutCache].dict[key_name];
    }
    return [_PDCCache defalutCache].dict[kDefaultkey];
}
@end

@implementation PDCCache

+(void )switchCacheByName:(NSString *)name
{
    key_name = name;
    [_PDCCache addKeyName:key_name];
}

+(void )setObject:(id )obj forKey:(NSString *)key
{
    [[_PDCCache cache] setObject:obj forKey:key];
}

+(id )objectForKey:(NSString *)key
{
    return [[_PDCCache cache] objectForKey:key];
}

+(void )removeObjectForKey:(NSString *)key
{
    [[_PDCCache cache] removeObjectForKey:key];
}

+(void )removeAllObject
{
    [[_PDCCache cache] removeAllObjects];
}
@end
