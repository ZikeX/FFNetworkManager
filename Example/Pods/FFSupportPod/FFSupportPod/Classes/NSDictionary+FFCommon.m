//
//  NSDictionary+FFCommon.m
//  FFObjC
//
//  Created by xujunquan on 16/12/6.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "NSDictionary+FFCommon.h"

NSString * escapeString(id object){
    NSString *unencodedString = [NSString stringWithFormat: @"%@", object];
    __autoreleasing NSString *s = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                                        (CFStringRef)unencodedString,
                                                                                                        NULL,
                                                                                                        (CFStringRef)@":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`",
                                                                                                        kCFStringEncodingUTF8));
    return s;
}

@implementation NSDictionary (FFCommon)
//字符串序列化，对特殊字符汉字等进行处理
- (NSString *)queryString {
    NSMutableString *queryString = nil;
    NSArray *keys = [self allKeys];
    keys = [keys sortedArrayUsingSelector:@selector(compare:)];
    if ([keys count] > 0) {
        for (id key in keys) {
            id value = [self objectForKey:key];
            if (nil == queryString) {
                queryString = [[NSMutableString alloc] init];
                [queryString appendFormat:@"?"];
            } else {
                [queryString appendFormat:@"&"];
            }
            
            if (nil != key && nil != value) {
                [queryString appendFormat:@"%@=%@", escapeString(key), escapeString(value)];
            } else if (nil != key) {
                [queryString appendFormat:@"%@", escapeString(key)];
            }
        }
    }
    return queryString;
}
@end
