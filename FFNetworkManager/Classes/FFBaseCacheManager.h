//
//  FFBaseCacheManager.h
//  FFObjC
//
//  Created by xujunquan on 16/11/1.
//  Copyright © 2016年 org_ian. All rights reserved.
//
/*
 缓存
 暂不实现对所有缓存进行检查，删除过期缓存，只是用到的缓存如果过期会自动删除。
 */

#import <Foundation/Foundation.h>

@interface FFBaseCacheManager : NSObject
///设置缓存有效时间
@property (nonatomic,assign)NSTimeInterval expireInterval;
///disk缓存大小
@property (nonatomic, assign)NSInteger cacheSize;

///缓存管理单利
+ (instancetype)manager;
///修改缓存文件路径(可以设置不同类型缓存，在不同文件路径下)
- (FFBaseCacheManager *)changeCachePath:(NSString *)cachePath;
///保存缓存
- (void)saveCache:(id)cache withKey:(NSString *)key;
///读取缓存
- (void)cacheWithKey:(NSString *)key withBlock:(void (^) (NSString *,id))block;
///删除缓存
- (void)deleteCacheWithKey:(NSString *)key;
///删除全部缓存
- (void)deleteAllCache;

@end
