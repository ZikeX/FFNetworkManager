//
//  FFBaseViewController.h
//  FFObjC
//
//  Created by xujunquan on 16/10/14.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFBaseViewModel.h"

@interface FFBaseViewController : UIViewController
///属性
@property (nonatomic, strong) NSMutableDictionary *baseParameters;
///显示返回按钮
@property (nonatomic, assign) BOOL showBackButton;
///主背景色
@property (nonatomic, strong) UIColor *mainBackgroundColor;

///返回按钮操作
- (void)actionNavBack:(UIButton *)button;

///流程控制
- (void)ff_init;
- (void)ff_addSubViewAndConstraints;
- (void)ff_bindViewModel;
- (void)ff_loadData;

///使用viewModel初始化控制器(对rac的支持)
- (instancetype)initWithViewModel:(FFBaseViewModel *)viewModel;

@end
