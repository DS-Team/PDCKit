//
//  PDCCache.m
//  PDCCache
//
//  Created by pdc on 16/8/20.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import "PDCDiskCache.h"
#import <CommonCrypto/CommonCrypto.h>

static PDCDiskCache *cache = nil;
static NSString *const kDefaultDir = @"github_chenjipdc";
static BOOL defaultDir = YES;

@interface PDCDiskCache()
@property (nonatomic, copy) NSString *path;
@property (nonatomic, strong) NSFileManager *fileManager;

@end

@implementation PDCDiskCache
-(void )setPath:(NSString *)path
{
    _path = path;
    if (path)
    {
        [PDCDiskCache pr_createDirWithURL:[NSURL fileURLWithPath:path]];
    }
}

#pragma mark - init
+(instancetype )defaultCache
{
    if (cache == nil)
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            cache = [PDCDiskCache new];
            cache.fileManager = [NSFileManager defaultManager];
            if (defaultDir)
            {
                cache.path = [PDCDiskCache pr_pathWithName:kDefaultDir];
            }
        });
    }
    return cache;
}

+(void )diskCacheWithPath:(NSString *)path
{
    defaultDir = NO;
    [PDCDiskCache pr_cacheWithPath:path];
}

+(void )diskCacheWithName:(NSString *)name
{
    defaultDir = NO;
    [PDCDiskCache pr_cacheWithPath:[PDCDiskCache pr_pathWithName:name]];
}

#pragma mark - dir and path
+(void )pr_createDirWithURL:(NSURL *)url
{
    NSError *error = nil;
    BOOL success = [cache.fileManager createDirectoryAtPath:url.path withIntermediateDirectories:YES attributes:nil error:&error];
    if (success && (error == nil))
    {
        NSLog(@"create directory success:%@",cache.path);
    }
    else
    {
        NSLog(@"\ncreate directory--%@\nerror--%@\nmethod--%s\nline--%d",cache.path,error.userInfo,_cmd,__LINE__);
        NSAssert(0, @"failed path");
    }
    
}

+(void )pr_cacheWithPath:(NSString *)path
{
    if (path == nil && [NSURL fileURLWithPath:path])
    {
        NSAssert(0, @"unknow");
    }
    else
    {
        [PDCDiskCache defaultCache].path = path;
    }
}

+(NSString *)pr_pathWithName:(NSString *)name
{
    NSString *homeDir = NSHomeDirectory();
    NSString *tempPath = [homeDir stringByAppendingPathComponent:@"Documents"];
    return [tempPath stringByAppendingPathComponent:name];
}

+(NSString *)pr_filePathWithKey:(NSString *)key
{
    return [cache.path stringByAppendingPathComponent:[PDCDiskCache pr_md5ByKey:key]];
}

+(NSString *)pr_filePathWithMD5Key:(NSString *)md5Key
{
    return [cache.path stringByAppendingPathComponent:md5Key];
}

+(NSString *)pr_md5ByKey:(NSString *)key
{
    const char *str = [key UTF8String];
    unsigned char md[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)key.length, md);
    NSMutableString *result = [NSMutableString string];
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
    {
        [result appendFormat:@"%02X", md[i]];
    }
    return [result copy];
}

#pragma mark - data
+(NSData *)dataWithKey:(NSString *)key
{
    return [[PDCDiskCache defaultCache].fileManager contentsAtPath:[PDCDiskCache pr_filePathWithKey:key]];
}

+(BOOL )writeData:(NSData *)data withKey:(NSString *)key
{
    return [[PDCDiskCache defaultCache].fileManager createFileAtPath:[PDCDiskCache pr_filePathWithKey:key] contents:data attributes:nil];;
}

+(BOOL )writeData:(NSData *)data withKey:(NSString *)key andUpdate:(BOOL )update
{
    if (update)
    {
        return [PDCDiskCache writeData:data withKey:key];
    }
    else
    {
        if (![[PDCDiskCache defaultCache].fileManager fileExistsAtPath:[PDCDiskCache pr_filePathWithKey:key]])
        {
            return [PDCDiskCache writeData:data withKey:key];
        }
    }
    return NO;
}

+(BOOL )existKey:(NSString *)key
{
    return [[PDCDiskCache defaultCache].fileManager fileExistsAtPath:[PDCDiskCache pr_filePathWithKey:key]];
}

+(void )clearDataWithKey:(NSString *)key
{
    NSString *path = [PDCDiskCache pr_filePathWithKey:key];
    [PDCDiskCache pr_clearDataWithPath:path];
}

+(void )pr_clearDataWithPath:(NSString *)path
{
    NSError *error = nil;
    BOOL success = [[PDCDiskCache defaultCache].fileManager removeItemAtPath:path error:&error];
    if (!success || (error != nil))
    {
        NSLog(@"\ndelete file--%@ \nerror--%@",path,error.userInfo);
    }
}

+(void )clearAllData
{
    NSError *error = nil;
    NSArray<NSString *> *fileNames = [[PDCDiskCache defaultCache].fileManager contentsOfDirectoryAtPath:[PDCDiskCache defaultCache].path error:&error];
    if (error)
    {
        NSLog(@"\ndelete file--%@ \nerror--%@",[PDCDiskCache defaultCache].path,error.userInfo);
        return;
    }
    [fileNames enumerateObjectsUsingBlock:^(NSString * _Nonnull md5Key, NSUInteger idx, BOOL * _Nonnull stop) {
        [PDCDiskCache pr_clearDataWithPath:[PDCDiskCache pr_filePathWithMD5Key:md5Key]];
    }];
}

@end
