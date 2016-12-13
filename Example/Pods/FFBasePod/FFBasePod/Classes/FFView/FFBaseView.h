//
//  FFBaseView.h
//  FFObjC
//
//  Created by xujunquan on 16/10/18.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFBaseViewModel.h"

@interface FFBaseView : UIView
///流程控制
- (void)ff_initWithViewModel:(id)viewModel;
- (void)ff_addSubViewAndConstraints;
- (void)ff_bindViewModel;

///使用viewModel初始化控制器(对rac的支持)
- (instancetype)initWithViewModel:(FFBaseViewModel *)viewModel;

@end
