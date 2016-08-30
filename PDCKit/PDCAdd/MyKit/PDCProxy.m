
//
//  PDCProxy.m
//  TestProxy
//
//  Created by pdc on 16/8/30.
//  Copyright © 2016年 RealsCloud. All rights reserved.
//

#import "PDCProxy.h"

@interface PDCProxy()

@end


@implementation PDCProxy
+(instancetype )proxyWithTarget:(id )target
{
    return [[PDCProxy alloc] initWithTarget:target];
}

-(instancetype )initWithTarget:(id )target
{
    _target = target;
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
//    NSLog(@"%s",invocation.selector);
    invocation.target = self.target;
    [invocation invoke];
}

- (nullable NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    if (self.target == nil)
    {
        NSAssert(0, @"对象被释放了，你还调什么鬼，说明你的代码出问题了");
    }
    return [self.target methodSignatureForSelector:sel];
}

-(NSUInteger )hash
{
    return [self.target hash];
}

-(Class )class
{
    return [self.target class];
}

-(Class )superclass
{
    return [self.target superclass];
}

-(BOOL )isEqual:(id)object
{
    return [self.target isEqual:object];
}

-(BOOL )respondsToSelector:(SEL)aSelector
{
    return [self.target respondsToSelector:aSelector];
}

-(BOOL )isProxy
{
    return YES;
}

-(NSString *)description
{
    return [self.target description];
}

-(NSString *)debugDescription
{
    return [self.target debugDescription];
}
@end
