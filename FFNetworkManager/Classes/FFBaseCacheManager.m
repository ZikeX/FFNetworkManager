//
//  FFBaseCacheManager.m
//  FFObjC
//
//  Created by xujunquan on 16/11/1.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseCacheManager.h"
#import "YYCache.h"

#define kDateKey        @"kDateKey"
#define kCacheDataKey   @"kCacheDataKey"

@interface FFBaseCacheManager ()
///缓存名字
@property (nonatomic, copy) NSString *cacheName;
@property (nonatomic, strong) YYCache *yyCache;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation FFBaseCacheManager
+ (instancetype)manager {
    static dispatch_once_t onceToken;
    static FFBaseCacheManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[FFBaseCacheManager alloc] init];
        instance.cacheName = @"cacheDefaultName";
        //缓存有效期为1天
        instance.expireInterval = 3600*24;
    });
    return instance;
}

- (void)saveCache:(id)cache withKey:(NSString *)key {
    NSDictionary *data = @{kDateKey:[NSDate date],
                           kCacheDataKey:cache};
    //伊布执行，提高性能
    [self.yyCache.diskCache setObject:data forKey:key withBlock:^{
        
    }];
//    Log(@"%@",self.yyCache.diskCache.path);
}

- (void)cacheWithKey:(NSString *)key withBlock:(void (^) (NSString *,id))block{
    __weak typeof(self)weakSelf = self;
    [self.yyCache.diskCache objectForKey:key withBlock:^(NSString * _Nonnull key, id<NSCoding>  _Nullable object) {
        
        NSDictionary *cache = (NSDictionary *)object;
        if (!cache || cache.count<2) {
            if (block) {
                block(key,nil);
            }
            return ;
        }
        
        NSDate *oriDate = cache[kDateKey];
        NSDate *curData = [NSDate date];
        NSTimeInterval interval = [curData timeIntervalSinceDate:oriDate];
        id data = (interval>weakSelf.expireInterval)?nil:cache[kCacheDataKey];
        if (!data) {
            [weakSelf deleteCacheWithKey:key];
        }
        if (block) {
            block(key,data);
        }
    }];
}

- (void)deleteCacheWithKey:(NSString *)key {
    [self.yyCache.diskCache removeObjectForKey:key];
}

- (FFBaseCacheManager *)changeCachePath:(NSString *)cachePath {
    if (![cachePath isEqualToString:self.cacheName]) {
        self.cacheName = cachePath;
        self.yyCache = nil;
    }
    return self;
}

- (void)deleteAllCache {
    [self.yyCache removeAllObjects];
}

#pragma mark- get
- (YYCache *)yyCache {
    if (!_yyCache) {
        _yyCache = [[YYCache alloc] initWithName:self.cacheName];
    }
    return _yyCache;
}

- (NSDateFormatter *)dateFormatter {
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH-mm-ss"];
    }
    return _dateFormatter;
}

- (NSInteger)cacheSize{
    return [self.yyCache.diskCache totalCost];
}

@end
