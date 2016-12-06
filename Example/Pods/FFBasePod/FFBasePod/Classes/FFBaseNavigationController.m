//
//  FFBaseNavigationController.m
//  FFObjC
//
//  Created by xujunquan on 16/10/14.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseNavigationController.h"

@interface FFBaseNavigationController ()

@end

@implementation FFBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark- statusBar 设置
- (UIViewController *)childViewControllerForStatusBarHidden {
    return self.topViewController;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return self.topViewController;
}

#pragma mark- 屏幕旋转
- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return [self.topViewController preferredInterfaceOrientationForPresentation];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
