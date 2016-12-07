//
//  FFBaseNetworkManager.m
//  FFObjC
//
//  Created by xujunquan on 16/10/25.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseNetworkManager.h"
#import "FFBaseCacheManager.h"
#import "FFBaseMacro.h"
#import "FFSupportPod.h"
#import "YYModel.h"

@interface FFBaseNetworkManager ()
///当前请求队列
@property (nonatomic, strong) NSOperationQueue* operationQueue;
///设置baseURL
@property (nonatomic, copy) NSString *baseUrl;
///为每个task设置不同的id在闭包回调中使用
@property (nonatomic, copy) NSString *identifier;
///当前task
@property (nonatomic, strong) NSURLSessionTask *currentTask;
///cache
@property (nonatomic, assign) BOOL supportCache;
@property (nonatomic, strong) FFBaseCacheManager *cacheManager;

@end

@implementation FFBaseNetworkManager

+ (instancetype)networkManager {
    return [[self alloc] init];
}

- (FFBaseNetworkManager *)supportCache:(BOOL)support {
    self.supportCache = support;
    return self;
}

- (FFBaseNetworkManager *)supportIdentifier:(NSString *)identifier {
    self.identifier = identifier;
    return self;
}

#pragma mark- baseMethod
- (void)cancelCurrentTask {
    if (self.currentTask) {
        [self.currentTask cancel];
    }
}

- (void)cancelAllTask {
    if (self.operationQueue) {
        [self.operationQueue cancelAllOperations];
    }
}

- (FFBaseNetworkManager *)postURL:(NSString *)URLString
                       parameters:(NSDictionary*)parameters
                           result:(void (^)(FFBaseNetworkModel *responseObject))result{
    
    self.operationQueue = self.sessionManager.operationQueue;
    //设置token
    NSDictionary *parametersWithToken = parameters;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(parametersWithTokenFromeOriPara:)]) {
        parametersWithToken = [self.dataSource parametersWithTokenFromeOriPara:parameters];
    }
    
    NSString *full = [NSString stringWithFormat:@"%@%@%@",self.baseUrl,URLString,[parametersWithToken queryString]?:@""];
    Log(@"\n👉GET👉 \nbaseurl = %@\nurlString = /%@\nparameters = %@\nfullURL = %@", self.baseUrl, URLString, [parametersWithToken queryString]?:@"",full);
    
    //没有问题，self的task指针指向每次生成的task地址并为其赋值，闭包返回的是task的内容。
    self.currentTask = [self.sessionManager POST:URLString parameters:parametersWithToken progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //success
        FFBaseNetworkModel *model = [FFBaseNetworkModel yy_modelWithJSON:responseObject];
        model.identifier = task.taskDescription;
        model.netStatus = FFNetStateEffective;
        result(model);
        
        //缓存支持
        if (self.supportCache) {
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //failure
        FFBaseNetworkModel *model = [[FFBaseNetworkModel alloc] init];
        if (error.code == NSURLErrorTimedOut) {
            model.netStatus = FFNetStateTimeout;
        }else if (error.code == NSURLErrorNotConnectedToInternet){
            model.netStatus = FFNetStateNetError;
        }else if (error.code == NSURLErrorCancelled){
            model.netStatus = FFNetStateCanceled;
        }else{
            model.netStatus = FFNetStateServerError;
        }
        model.identifier = task.taskDescription;
        model.dataStatus = 0;
        model.msg = (error.code == NSURLErrorNotConnectedToInternet)?kNetErrorAlertMsg:error.localizedDescription;
        model.data = nil;
        result(model);
    }];
    
    self.currentTask.taskDescription = self.identifier;
    return self;
}

- (FFBaseNetworkManager *)getURL:(NSString *)URLString
                      parameters:(NSDictionary*)parameters
                          result:(void (^)(FFBaseNetworkModel *responseObject))result{
    
    self.operationQueue = self.sessionManager.operationQueue;
    //设置token
    NSDictionary *parametersWithToken = parameters;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(parametersWithTokenFromeOriPara:)]) {
        parametersWithToken = [self.dataSource parametersWithTokenFromeOriPara:parameters];
    }
    
    NSString *full = [NSString stringWithFormat:@"%@%@%@",self.baseUrl,URLString,[parametersWithToken queryString]?:@""];
    Log(@"\n👉GET👉 \nbaseurl = %@\nurlString = /%@\nparameters = %@\nfullURL = %@", self.baseUrl, URLString, [parametersWithToken queryString]?:@"",full);
    
    self.currentTask = [self.sessionManager GET:URLString parameters:parametersWithToken progress:^(NSProgress * _Nonnull uploadProgress) {
        //
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //success
        FFBaseNetworkModel *model = [FFBaseNetworkModel yy_modelWithJSON:responseObject];
        model.identifier = task.taskDescription;
        model.netStatus = FFNetStateEffective;
        result(model);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //failure
        FFBaseNetworkModel *model = [[FFBaseNetworkModel alloc] init];
        if (error.code == NSURLErrorTimedOut) {
            model.netStatus = FFNetStateTimeout;
        }else if (error.code == NSURLErrorNotConnectedToInternet){
            model.netStatus = FFNetStateNetError;
        }else if (error.code == NSURLErrorCancelled){
            model.netStatus = FFNetStateCanceled;
        }else{
            model.netStatus = FFNetStateServerError;
        }
        model.identifier = task.taskDescription;
        model.dataStatus = 0;
        model.msg = (error.code == NSURLErrorNotConnectedToInternet)?kNetErrorAlertMsg:error.localizedDescription;
        model.data = nil;
        result(model);
    }];
    
    self.currentTask.taskDescription = self.identifier;
    return self;
}

- (FFBaseNetworkManager *)downloadFileFromURL:(NSString *)sourceUrl toPath:(NSString *)desPath parameters:(NSDictionary *)parameters progress:(void(^)(float progress))progressBlock completion:(void(^)(NSURLResponse *reponse,NSURL *filePath,NSError *error))completionBlock{
//    self.operationQueue = self.sessionManager.operationQueue;
    sourceUrl = [NSString stringWithFormat:@"%@%@",self.baseUrl,sourceUrl];
    NSLog(@"source url = %@",sourceUrl);
    NSMutableURLRequest *request = [self.sessionManager.requestSerializer requestWithMethod:@"POST" URLString:sourceUrl parameters:parameters error:nil];

    NSURLSessionDownloadTask *task = [self.sessionManager downloadTaskWithRequest:request
                                                                         progress:^(NSProgress * _Nonnull downloadProgress) {
                                                                             
                                                                         } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
                                                                             return [NSURL fileURLWithPath:desPath];
                                                                         } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
                                                                             if (completionBlock) {
                                                                                 completionBlock(response,filePath,error);
                                                                             }
                                                                         }];
    
    
    [task resume];

    return self;
}

#pragma mark- get
- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseUrl]];
        //设置请求
        [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        //设置响应
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                                     @"application/json",
                                                                     @"text/plain",
                                                                     @"text/javascript",
                                                                     @"text/json",
                                                                     @"text/html", nil];
    }
    return _sessionManager;
}

- (FFBaseCacheManager *)cacheManager {
    if (!_cacheManager) {
        _cacheManager = [FFBaseCacheManager manager];
    }
    return _cacheManager;
}

- (NSString *)baseUrl {
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(baseURL)]) {
        return [self.dataSource baseURL];
    }else{
        return @"";
    }
}


@end
