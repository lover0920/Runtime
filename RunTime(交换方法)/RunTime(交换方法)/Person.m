//
//  Person.m
//  RunTime(交换方法)
//
//  Created by 孙号斌 on 2017/8/23.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import "Person.h"
#import <objc/message.h>


@implementation Person
/*************** 消息机制 ***************/
+ (void)learn:(NSString *)str
{
    NSLog(@"类的消息机制：学习\"%@\"",str);
}
- (void)learn:(NSString *)str
{
    NSLog(@"对象的消息机制：学习\"%@\"",str);
}






/*************** 动态添加方法 ***************/
void eat(id self, SEL sel)
{
    NSLog(@"动态添加无参的eat方法");
}

+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    if (sel == @selector(eat))
    {
        class_addMethod([Person class], sel, (IMP)eat, "v@:");
        return YES;
    }
    
    return [super resolveClassMethod:sel];
}
@end
