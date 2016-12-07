//
//  FFExtendNetworkManager.h
//  FFObjC
//
//  Created by xujunquan on 16/10/25.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFBaseNetworkManager.h"

///获取网络处理实例
#define kFFExtendNetworkInstance [[FFExtendNetworkManager manager] networkManager]

@interface FFExtendNetworkManager : NSObject<FFBaseNetworkManagerDataSource>
///设置baseurl
@property (nonatomic, copy) NSString *baseURL;
///缓存支持
@property (nonatomic, assign) BOOL supportCache;
///自定义数据加密方法
@property (nonatomic, copy) NSDictionary *(^dataEncryptionBlock) (NSDictionary *);

+ (instancetype)manager;
- (FFBaseNetworkManager *)networkManager;


@end
