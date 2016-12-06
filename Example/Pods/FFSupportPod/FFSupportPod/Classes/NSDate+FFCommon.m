//
//  NSDate+FFCommon.m
//  FFObjC
//
//  Created by xujunquan on 16/12/6.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "NSDate+FFCommon.h"

@implementation NSDate (FFCommon)
- (NSString *)timestamp {
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[self timeIntervalSince1970]];
    return timeSp;
}

@end
