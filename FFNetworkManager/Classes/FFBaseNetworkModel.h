//
//  FFBaseNetworkModel.h
//  FFObjC
//
//  Created by xujunquan on 16/10/25.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,FFNetState) {
    FFNetStateEffective = 0,
    FFNetStateCanceled,
    FFNetStateServerError,
    FFNetStateNetError,
    FFNetStateTimeout,
    FFNetStateOtherError
};

@interface FFBaseNetworkModel : NSObject
///网络状态
@property (nonatomic, assign) FFNetState netStatus;
///请求标志
@property (nonatomic, copy) NSString *identifier;


//服务器返回数据
///数据状态0-失败，1-成功
@property (nonatomic, assign) NSInteger dataStatus;
///错误提示
@property (nonatomic, copy) NSString *msg;
///数据
@property (nonatomic, strong) id data;

@end
