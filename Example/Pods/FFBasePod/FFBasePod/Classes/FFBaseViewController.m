//
//  FFBaseViewController.m
//  FFObjC
//
//  Created by xujunquan on 16/10/14.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseViewController.h"

@interface FFBaseViewController ()
@property (nonatomic, strong) UIButton *backButton;
@end

@implementation FFBaseViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //默认设置
    self.mainBackgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = self.mainBackgroundColor;
    self.showBackButton = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    self.navigationController.interactivePopGestureRecognizer.delegate = (id) self;
    //流程
    //需要有ff_init方法，因为在子类执行viewDidLoad方法时会先调用重写的ff_addSubView等方法，没有地方可以进行参数初始化。
    [self ff_init];
    [self ff_addSubViewAndConstraints];
    [self ff_bindViewModel];
    [self ff_loadData];
}

- (void)actionNavBack:(UIButton *)button {
    if (self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

#pragma mark- set/get
- (void)setShowBackButton:(BOOL)showBackButton {
    _showBackButton = showBackButton;
    self.backButton.hidden = !showBackButton;
}

- (void)setMainBackgroundColor:(UIColor *)mainBackgroundColor {
    _mainBackgroundColor = mainBackgroundColor;
    self.view.backgroundColor = mainBackgroundColor;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.frame = CGRectMake(0, 0, 60, 44);
        _backButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        _backButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
        
        [_backButton setImage:[UIImage imageNamed:@"FFBaseCtr_back"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"FFBaseCtr_back_h"] forState:UIControlStateHighlighted];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _backButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_backButton addTarget:self action:@selector(actionNavBack:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

#pragma mark- statusBar 默认设置
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark- 屏幕旋转默认设置
- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

#pragma mark- 流程控制
- (void)ff_init {
    
}

- (void)ff_addSubViewAndConstraints {
    
}

- (void)ff_bindViewModel {
    
}

- (void)ff_loadData {
    
}

#pragma mark- rac的支持
//该方法与init/new是互斥的，需要注意
- (instancetype)initWithViewModel:(FFBaseViewModel *)viewModel {
    self = [super init];
    if (self) {
        
    }
    return self;
}

#pragma mark- system
- (void)dealloc {
    //移除消息观察
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSString *className = [NSString stringWithUTF8String:object_getClassName(self)];
    NSLog(@"%@已执行,%@",NSStringFromSelector(_cmd),className);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
