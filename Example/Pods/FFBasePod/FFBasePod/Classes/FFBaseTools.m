//
//  FFTools.m
//  FFObjC
//
//  Created by xujunquan on 16/10/19.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseTools.h"
//ip
#import <ifaddrs.h>
#import <arpa/inet.h>
//md5
#import <CommonCrypto/CommonDigest.h>

//图片模糊处理
#import <Accelerate/Accelerate.h>

@implementation FFBaseTools
+ (UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

+ (BOOL)validEmail:(NSString *)email{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (BOOL) validMobile:(NSString *)mobile{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

+ (BOOL)validCarNumber:(NSString *)number {
    NSString *regex = @"[A-Z0-9a-z]{17}";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [test evaluateWithObject:number];
}

#pragma mark-
+ (UIImage *)getImageFromBundleWithName:(NSString *)imageName {
    //使用pod库bundle中的图片
    NSBundle *bundle = [NSBundle bundleForClass:NSClassFromString(@"FFMainView")];
    NSString *bundlePath = [bundle pathForResource:@"FFMainView" ofType:@"bundle"];
    NSBundle *resourceBundle = [NSBundle bundleWithPath:bundlePath];
    UIImage *image = [UIImage imageNamed:imageName inBundle:resourceBundle compatibleWithTraitCollection:nil];
    
    //使用项目主体bundle中的图片
    if (!image) {
        resourceBundle = [NSBundle mainBundle];
        image = [UIImage imageNamed:imageName inBundle:resourceBundle compatibleWithTraitCollection:nil];
    }
    return image;
}

@end
