//
//  FFTools.h
//  FFObjC
//
//  Created by xujunquan on 16/10/19.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FFBaseTools : NSObject
///获取当前活动的viewcontroller
+ (UIViewController*)topViewController;

///邮箱验证
+ (BOOL)validEmail:(NSString *)email;
///手机验证
+ (BOOL) validMobile:(NSString *)mobile;
//匹配车架号
+ (BOOL)validCarNumber:(NSString *)number;

#pragma mark-
//先从内部寻找资源，如果没有则从外部寻找
+ (UIImage *)getImageFromBundleWithName:(NSString *)imageName;


@end
