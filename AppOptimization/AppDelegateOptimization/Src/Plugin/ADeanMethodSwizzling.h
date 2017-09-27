//
//  ADeanMethodSwizzling.h
//  AppDelegateOptimization
//
//  Created by adorkable dean on 15/6/17.
//  Copyright (c) 2015年 ADean. All rights reserved.
//

#import <Foundation/Foundation.h>


NSDictionary *GetPropertyListOfClass(Class cls);
void SwizzlingMethod(Class c, SEL origSEL, SEL newSEL);
