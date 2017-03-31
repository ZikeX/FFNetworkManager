//
//  FFBaseNetworkModel.m
//  FFObjC
//
//  Created by xujunquan on 16/10/25.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseNetworkModel.h"

@implementation FFBaseNetworkModel
- (BOOL)dataValid {
    //返回数据有效性判断
    if (self.netStatus == FFNetStateEffective && self.responseDictionary &&[self.responseDictionary isKindOfClass:[NSDictionary class]]) {
        return YES;
    }else{
        return NO;
    }
}

@end
