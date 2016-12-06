//
//  FFBaseCollectionViewCell.m
//  FFObjC
//
//  Created by xujunquan on 16/10/24.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseCollectionViewCell.h"

@implementation FFBaseCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self ff_addSubViewAndConstraints];
    }
    return self;
}

- (void)ff_addSubViewAndConstraints {
    
}

@end
