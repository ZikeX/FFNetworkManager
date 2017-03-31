//
//  FFBaseNetworkManager.h
//  FFObjC
//
//  Created by xujunquan on 16/10/25.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "FFBaseNetworkModel.h"

@interface FFBaseNetworkManager : NSObject
@property (nonatomic, strong) AFHTTPSessionManager* sessionManager;
///baseURL
@property (nonatomic, copy) NSString* (^baseURL) (void);
///加密规则
@property (nonatomic, copy) NSDictionary * (^parametersWithToken) (NSDictionary *);


///缓存支持
- (FFBaseNetworkManager *)supportCache:(BOOL)support;

///identifier
- (FFBaseNetworkManager *)supportIdentifier:(NSString *)identifier;

#pragma mark- baseMethod
///取消当前任务
- (void)cancelCurrentTask;

///取消队列中全部任务
- (void)cancelAllTask;

/**
 *功能：POST请求
 *参数：(1)请求的url: urlString
 *     (2)POST请求体参数:parameters
 *     (3)请求结果: result
 */
- (FFBaseNetworkManager *)postURL:(NSString *)URLString
                       parameters:(NSDictionary*)parameters
                           result:(void (^)(FFBaseNetworkModel *responseObject))result;

/**
 *功能：GET请求
 *参数：(1)请求的url: urlString
 *     (2)POST请求体参数:parameters
 *     (3)请求结果: result
 */
- (FFBaseNetworkManager *)getURL:(NSString *)URLString
                      parameters:(NSDictionary*)parameters
                          result:(void (^)(FFBaseNetworkModel *responseObject))result;




@end


