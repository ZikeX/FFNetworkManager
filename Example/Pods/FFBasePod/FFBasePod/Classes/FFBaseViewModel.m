//
//  FFBaseViewModel.m
//  FFObjC
//
//  Created by xujunquan on 16/10/18.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseViewModel.h"

@implementation FFBaseViewModel
- (instancetype)init {
    return [self initWithModel:nil];
}

- (instancetype)initWithModel:(FFBaseModel *)model {
    self = [super init];
    if (self) {
        [self ff_initWithModel:model];
    }
    return self;
}

- (void)ff_initWithModel:(id)model {
    
}
@end
