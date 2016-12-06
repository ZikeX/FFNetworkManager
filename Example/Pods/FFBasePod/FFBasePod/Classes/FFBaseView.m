//
//  FFBaseView.m
//  FFObjC
//
//  Created by xujunquan on 16/10/18.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseView.h"

@implementation FFBaseView

- (instancetype)init {
    return [self initWithViewModel:nil];
}

- (instancetype)initWithViewModel:(FFBaseViewModel *)viewModel {
    self = [super init];
    if (self) {
        [self ff_initWithViewModel:viewModel];
        [self ff_addSubViewAndConstraints];
        [self ff_bindViewModel];
    }
    return self;
}

#pragma mark- control

- (void)ff_initWithViewModel:(id)viewModel {
    
}

- (void)ff_addSubViewAndConstraints {
    
}

- (void)ff_bindViewModel {
    
}

@end
