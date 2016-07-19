//
//  UIImage+PDCAdd.m
//  ColorAndImage
//
//  Created by KH on 16/7/19.
//  Copyright © 2016年 pdc. All rights reserved.
//

#import "UIImage+PDCAdd.h"
#import "UIColor+PDCAdd.h"
#import <ImageIO/ImageIO.h>

@implementation UIImage (PDCAdd)
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize )size
{
    CGRect rect = CGRectMake(0, 0, size.width==0?2.0f:size.width, size.height==0?2.0:size.height);
    UIGraphicsBeginImageContext(rect.size);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageWithRGBValue:(UInt32 )rgbValue size:(CGSize )size
{
    CGRect rect = CGRectMake(0, 0, size.width==0?2.0f:size.width, size.height==0?2.0:size.height);
    UIGraphicsBeginImageContext(rect.size);
    [[UIColor colorWithRGB:rgbValue] setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageWithRGBAValue:(UInt32 )rgbaValue size:(CGSize )size
{
    CGRect rect = CGRectMake(0, 0, size.width==0?2.0f:size.width, size.height==0?2.0:size.height);
    UIGraphicsBeginImageContext(rect.size);
    [[UIColor colorWithRGBA:rgbaValue] setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+(UIImage *)imageWithGIFName:(NSString *)name
{
    return [UIImage imageWithGIFName:name duration:nil];
}

+(UIImage *)imageWithGIFName:(NSString *)name duration:(NSNumber *)duration
{
    NSString *path =[[NSBundle mainBundle] pathForResource:name ofType:@"gif"];;
    NSData *data = [NSData dataWithContentsOfFile:path];
    if (!data)
    {
        return nil;
    }
    //获取图片资源
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    size_t imageCount = CGImageSourceGetCount(source);
    
    UIImage *animatedImage = nil;
    
    if (imageCount <= 1)
    {
        animatedImage = [[UIImage alloc] initWithData:data];
    }
    else
    {
        NSMutableArray *images = [NSMutableArray array];
        
        NSTimeInterval duration1 = 0.0f;
        
        for (size_t i = 0; i < imageCount; i++)
        {
            //通过下标获取对应图片
            CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
            if (duration)
            {
                duration1 = [duration floatValue];
            }
            else
            {
                //获取下标下资源文件图片信息
                CFDictionaryRef cfDict = CGImageSourceCopyPropertiesAtIndex(source,i,nil);
                NSDictionary *tempDict = (__bridge id)cfDict;
                NSDictionary *timeDict = tempDict[(NSString *)kCGImagePropertyGIFDictionary];
                //取出下标对应图片的间隔时间
                if ([timeDict[(NSString *)kCGImagePropertyGIFDelayTime] floatValue] > 0.0f)
                {
                    duration1 += [timeDict[(NSString *)kCGImagePropertyGIFDelayTime] floatValue];
                }
                else
                {
                    duration1 += [timeDict[(NSString *)kCGImagePropertyGIFUnclampedDelayTime] floatValue];
                }
            }
            [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
            
            CGImageRelease(image);
        }
        
        if (duration1 < 0.01f)
        {
            duration1 = (1.618f / 10.0f) * imageCount;
        }
        
        animatedImage = [UIImage animatedImageWithImages:[images copy] duration:duration1];
    }
    
    CFRelease(source);
    return animatedImage;
}
@end
