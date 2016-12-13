//
//  FFBaseMacro.h
//  FFObjC
//
//  Created by xujunquan on 16/10/14.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#ifndef FFBaseMacro_h
#define FFBaseMacro_h

#ifdef DEBUG
//开发环境
#define Log_Debug( s, ... ) NSLog( @"\n<mem=%p,file=%@,line=%d,fun=(%@)>\n%@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  NSStringFromSelector(_cmd), [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else
//生产环境
#define Log_Debug( s, ... )


#endif





#pragma mark - MACRO
#define kFF_IPHONE4    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),   [[UIScreen mainScreen]currentMode].size) : NO)
#define kFF_IPHONE5    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),  [[UIScreen mainScreen]currentMode].size) : NO)
#define kFF_IPHONE6    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334),  [[UIScreen mainScreen]currentMode].size) : NO)
#define kFF_IPHONE6P   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen]currentMode].size) : NO)

#define kFF_IOS8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define kFF_IOS9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)
#define kFF_IOS10_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

#define kFF_SCREEN_WIDTH    ([[UIScreen mainScreen]bounds].size.width)
#define kFF_SCREEN_HEIGHT  ([[UIScreen mainScreen]bounds].size.height)

#define kFF_APP_NAME          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kFF_APP_VERSION       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kFF_APP_BUILD_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#endif /* FFBaseMacro_h */



