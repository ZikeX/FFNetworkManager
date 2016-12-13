//
//  DZNNetworkErrorView.m
//  Pcms
//
//  Created by xujunquan on 16/10/20.
//  Copyright © 2016年 cig. All rights reserved.
//

#import "FFBaseReloadView.h"
#import "FFBaseTools.h"
#import "Masonry.h"
#import "ReactiveCocoa.h"

@interface FFBaseReloadView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *actionButton;
@end

@implementation FFBaseReloadView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self ff_addSubViewAndConstraints];
    }
    return self;
}

- (void)ff_addSubViewAndConstraints {
    [self addSubview:self.imageView];
    [self addSubview:self.contentLabel];
    [self addSubview:self.titleLabel];
    [self addSubview:self.actionButton];
    
    //设置图片压缩优先级低，则图片被压缩显示，不会造成label无法显示的状况,重要方法
    [self.imageView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(@35);
        make.left.right.equalTo(self);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.imageView.mas_bottom).offset(9);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(3);
    }];
    
    [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(25);
        make.size.mas_equalTo(CGSizeMake(210/2, 30));
        make.bottom.equalTo(self.mas_bottom);
    }];
}

#pragma mark- get
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [UILabel new];
        _contentLabel.font = [UIFont systemFontOfSize:11];
        _contentLabel.textColor = [UIColor lightGrayColor];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLabel;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _titleLabel;
}

- (UIButton *)actionButton {
    if (!_actionButton) {
        _actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _actionButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_actionButton setTitle:@"重新加载" forState:UIControlStateNormal];
        [_actionButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _actionButton.layer.cornerRadius = 15;
        _actionButton.layer.borderWidth = 1;
        _actionButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _actionButton.layer.masksToBounds = YES;
        
        @weakify(self);
        [[_actionButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            @strongify(self);
            if (self.buttonClickedBlock) {
                self.buttonClickedBlock(_actionButton);
            }
        }];
    }
    return _actionButton;
}

#pragma mark- set
- (void)setContentText:(NSString *)contentText {
    _contentText = contentText;
    self.titleLabel.text = contentText;
}

- (void)setContentSubText:(NSString *)contentSubText {
    _contentSubText = contentSubText;
    self.contentLabel.text = contentSubText;
}

- (void)setContentImage:(NSString *)contentImage {
    _contentImage = contentImage;
    self.imageView.image = [FFBaseTools getImageFromBundleWithName:contentImage];
}

- (void)setTopSpace:(float)topSpace {
    _topSpace = topSpace;
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@(topSpace));
    }];
}

- (void)setBottomSpace:(float)bottomSpace {
    _bottomSpace = bottomSpace;
    [self.actionButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(bottomSpace));
    }];
}

- (void)setBetSpace1:(float)betSpace1 {
    _betSpace1 = betSpace1;
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(_betSpace1);
    }];
}

- (void)setBetSpace2:(float)betSpace2 {
    _betSpace2 = betSpace2;
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(betSpace2);
    }];
}

- (void)setBetSpace3:(float)betSpace3 {
    _betSpace3 = betSpace3;
    [self.actionButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(betSpace3);
    }];
}
@end
