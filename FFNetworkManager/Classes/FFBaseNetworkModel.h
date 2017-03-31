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
///错误信息
@property (nonatomic, copy) NSString *errorMsg;

///服务器返回的数据
@property (nonatomic, strong) NSDictionary *responseDictionary;
///如果数据有效
@property (nonatomic, assign) BOOL dataValid;


@end
