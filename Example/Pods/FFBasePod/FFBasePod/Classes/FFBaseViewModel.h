//
//  FFBaseViewModel.h
//  FFObjC
//
//  Created by xujunquan on 16/10/18.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FFBaseModel.h"

@interface FFBaseViewModel : NSObject
///流程控制
- (void)ff_initWithModel:(id)model;
///使用model初始化vm
- (instancetype)initWithModel:(FFBaseModel *)model;

@end
