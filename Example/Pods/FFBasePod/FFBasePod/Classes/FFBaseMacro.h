//
//  FFBaseMacro.h
//  FFObjC
//
//  Created by xujunquan on 16/10/14.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#ifndef FFBaseMacro_h
#define FFBaseMacro_h


#pragma mark- masonry
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS


#ifdef DEBUG

///debug log
#define Log_Debug( s, ... ) NSLog( @"\n<mem=%p,file=%@,line=%d,fun=(%@)>\n%@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__,  NSStringFromSelector(_cmd), [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#define Log( ... ) NSLog( __VA_ARGS__ )

#else

///debug log
#define Log_Debug( s, ... )
#define Log( ... )

#endif









#pragma mark -
#define kIPHONE4    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),   [[UIScreen mainScreen]currentMode].size) : NO)
#define kIPHONE5    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),  [[UIScreen mainScreen]currentMode].size) : NO)
#define kIPHONE6    ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334),  [[UIScreen mainScreen]currentMode].size) : NO)
#define kIPHONE6P   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen]currentMode].size) : NO)

#pragma mark -
#define kIOS6_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0)
#define kIOS7_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define kIOS8_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define kIOS9_OR_LATER    ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0)

#pragma mark -
#define kStatusBarHeight (20)
#define kNavigationBarHeight (44)
#define kSCREEN_WIDTH    ([[UIScreen mainScreen]bounds].size.width)
#define kSCREEN_HEIGHT  ([[UIScreen mainScreen]bounds].size.height)

#pragma mark - 颜色
#define RGB(r,g,b)      [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) /255.0f alpha:1.0]
#define RGBA(r,g,b,a)   [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) /255.0f alpha:(a)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0f green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0f blue:((float)(rgbValue & 0xFF)) /255.0f alpha:1.0]


#pragma mark - 判断系统版本高于或者低于某一个版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define APP_NAME          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define APP_VERSION       [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define APP_BUILD_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]



#define PNGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"png"]
#define JPGPATH(NAME)           [[NSBundle mainBundle] pathForResource:[NSString stringWithUTF8String:NAME] ofType:@"jpg"]


#define IMG_NAMED(imgName) [UIImage imageNamed:imgName]



#endif /* FFBaseMacro_h */



