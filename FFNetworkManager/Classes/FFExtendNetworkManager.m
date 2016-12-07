//
//  FFExtendNetworkManager.m
//  FFObjC
//
//  Created by xujunquan on 16/10/25.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFExtendNetworkManager.h"

@implementation FFExtendNetworkManager
- (instancetype)init {
    self = [super init];
    if (self) {
        self.baseURL = @"";
        self.supportCache = NO;
    }
    return self;
}

+ (instancetype)manager {
    static FFExtendNetworkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FFExtendNetworkManager alloc] init];
    });
    return instance;
}

#pragma mark- url
- (NSString *)baseURL {
    return _baseURL;
}

#pragma mark- token 自定义数据格式和md5加密内容
- (NSDictionary *)parametersWithTokenFromeOriPara:(NSDictionary *)oriPar {
    if (self.dataEncryptionBlock) {
        return self.dataEncryptionBlock(oriPar);
    }
    return oriPar;
}

#pragma mark- get
- (FFBaseNetworkManager *)networkManager {
    FFBaseNetworkManager *networkManater = [FFBaseNetworkManager networkManager];
    networkManater.dataSource = self;
    [networkManater supportCache:self.supportCache];
    [networkManater supportIdentifier:@""];
    return networkManater;
}

@end
