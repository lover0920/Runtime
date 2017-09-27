//
//  UIImage+Extend.m
//  RunTime(交换方法)
//
//  Created by 孙号斌 on 2017/8/23.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import "UIImage+Extend.h"
#import <objc/message.h>

@implementation UIImage (Extend)
/*************** 交换方法 ***************/
+ (void)load
{
    //获取类方法
    /*
     获取对象方法
     class_getInstanceMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
     获取类方法
     class_getClassMethod(<#__unsafe_unretained Class cls#>, <#SEL name#>)
     */
    
    Method imageNamed = class_getClassMethod([UIImage class], @selector(imageNamed:));
    Method xd_imageNamed = class_getClassMethod([UIImage class], @selector(xd_imageNamed:));
    
    //交换类方法
    method_exchangeImplementations(imageNamed, xd_imageNamed);
}
+ (UIImage *)xd_imageNamed:(NSString *)imageName
{
    UIImage *image = [UIImage xd_imageNamed:imageName];
    
    if (image == nil) {
        NSLog(@"加载的图片\"%@\"为空",imageName);
    }
    
    return image;
}




/*************** 给分类添加属性 ***************/
static const char *key = "name";
- (void)setAge:(NSString *)age
{
    objc_setAssociatedObject(self, key, age, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)age
{
    return objc_getAssociatedObject(self, key);
}


@end
