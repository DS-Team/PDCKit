//
//  UIBarButtonItem+PDCAdd.m
//  ColorAndImage
//
//  Created by KH on 16/7/19.
//  Copyright © 2016年 pdc. All rights reserved.
//

#import "UIBarButtonItem+PDCAdd.h"
#import <objc/runtime.h>

@interface UIBarButtonItem ()
@property (nonatomic, copy) void(^block)();

@end

@implementation UIBarButtonItem (PDCAdd)
+(instancetype )itemWithTitle:(NSString *)title action:(void(^)() )action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:nil action:NULL];
    item.target = item;
    item.action = @selector(itemAction:);
    item.block = action;
    return item;
}

+(instancetype )itemWithImage:(UIImage *)image action:(void(^)() )action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:nil action:NULL];
    item.target = item;
    item.action = @selector(itemAction:);
    item.block = action;
    return item;
}

+(instancetype )itemWithSystemItem:(UIBarButtonSystemItem)systemItem action:(void(^)() )action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:nil action:NULL];
    item.target = item;
    item.action = @selector(itemAction:);
    item.block = action;
    return item;
}

-(void )itemAction:(id )sender
{
    if (self.block)
    {
        self.block();
    }
}

-(void )setBlock:(void(^ )() )block
{
    objc_setAssociatedObject(self, @selector(block), block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(void(^)())block
{
    return objc_getAssociatedObject(self, _cmd);
}
@end
