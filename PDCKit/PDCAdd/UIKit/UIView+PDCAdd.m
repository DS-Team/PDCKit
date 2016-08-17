//
//  UIView+PDCAdd.m
//  UICategory
//
//  Created by KH on 16/6/4.
//  Copyright © 2016年 KH. All rights reserved.
//

#import "UIView+PDCAdd.h"
@implementation UIView (PDCAdd)


/* x,y,midX,midY,maxX,maxY,width,height */
-(void )setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

-(CGFloat )x
{
    return CGRectGetMinX(self.frame);
}

-(void )setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

-(CGFloat )y
{
    return CGRectGetMinY(self.frame);
}

-(CGFloat )midX
{
    return CGRectGetMidX(self.frame);
}

-(CGFloat )maxX
{
    return CGRectGetMaxX(self.frame);
}

-(CGFloat )midY
{
    return CGRectGetMidY(self.frame);
}

-(CGFloat )maxY
{
    return CGRectGetMaxY(self.frame);
}

-(void )setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

-(CGFloat )width
{
    return CGRectGetWidth(self.frame);
}

-(void )setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

-(CGFloat )height
{
    return CGRectGetHeight(self.frame);
}


/* origin,size */
-(void )setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

-(CGPoint )origin
{
    return self.frame.origin;
}

-(void )setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

-(CGSize )size
{
    return self.frame.size;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    
    if (borderWidth < 0) {
        return;
    }
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

- (CGFloat)borderWidth
{
    return self.borderWidth;
}

- (UIColor *)borderColor
{
    return self.borderColor;
    
}

- (CGFloat)cornerRadius
{
    return self.cornerRadius;
}
@end
