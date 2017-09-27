//
//  ViewController.m
//  RunTime(交换方法)
//
//  Created by 孙号斌 on 2017/8/23.
//  Copyright © 2017年 孙号斌. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>
#import "UIImage+Extend.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    Person *per = [[Person alloc] init];
    
    //1、消息机制
    //objc_msgSend([Person class], @selector(learn:), @"英语");
    //objc_msgSend(per, @selector(learn:), @"数学");
    
    //2、交换方法
    //[UIImage imageNamed:@"adfa"];
    
    //3、动态添加方法
    //[per performSelector:@selector(eat)];
    
    //4、给分类添加属性
    UIImage *image = [UIImage imageNamed:@"123"];
    image.age = @"adfa";
    NSLog(@"给分类添加属性：age = %@",image.age);
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
