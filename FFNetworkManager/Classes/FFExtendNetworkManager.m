//
//  FFExtendNetworkManager.m
//  FFObjC
//
//  Created by xujunquan on 16/10/25.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFExtendNetworkManager.h"

@interface FFExtendNetworkManager ()
///md5加密用
@property (nonatomic, copy) NSString *signMD5Key;

@end

@implementation FFExtendNetworkManager
@synthesize baseURL = _baseURL;

- (instancetype)init {
    self = [super init];
    if (self) {
        //基本配置
        self.baseURL = @"http://www.api.com";
        self.signMD5Key = @"5RH4183O-HEEB-7630-TT39-YYG768G84CIG";
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

- (void)setBaseURL:(NSString *)baseURL {
    _baseURL = baseURL;
}

#pragma mark- token 自定义数据格式和md5加密内容
- (NSDictionary *)parametersWithTokenFromeOriPara:(NSDictionary *)oriPar {
    return nil;
}

//- (NSDictionary *)fullParams:(NSDictionary *)dict {
//    NSMutableDictionary *mutDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
//    [mutDict setObject:@"ios" forKey:@"platform"];
//    [mutDict setObject:APP_VERSION forKey:@"appversion"];
//    [mutDict setObject:[[NSDate date] timestamp] forKey:@"timestamp"];
//
//    
//    [mutDict setObject:@"" forKey:@"uid"];
//    NSString *sign = [self md5WithParams:mutDict];
//    [mutDict setObject:sign forKey:@"sign"];
//    return mutDict;
//}

//- (NSString *)md5WithParams:(NSDictionary *)dict {
//    NSArray *keys = [dict allKeys];
//    NSArray *sortedArray = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2){
//        return [obj1 compare:obj2];
//    }];
//    
//    NSMutableString *fullStr = [[NSMutableString alloc] init];
//    for (NSString *key in sortedArray) {
//        [fullStr appendFormat:@"%@=%@&", key, [dict objectForKey:key]];
//    }
//    [fullStr deleteCharactersInRange:NSMakeRange(fullStr.length - 1, 1)];
//    [fullStr setString:[fullStr lowercaseString]];
//    [fullStr appendString:self.signMD5Key];
//    return [fullStr md5String];
//}


#pragma mark- get
- (FFBaseNetworkManager *)networkManager {
    FFBaseNetworkManager *networkManater = [FFBaseNetworkManager networkManager];
    networkManater.dataSource = self;
    networkManater.delegate = self;
    [networkManater supportCache:self.supportCache];
    [networkManater supportIdentifier:@""];
    return networkManater;
}

@end
