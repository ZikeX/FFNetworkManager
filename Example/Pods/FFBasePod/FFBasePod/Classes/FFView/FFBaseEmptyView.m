//
//  DZNEmptyView.m
//  Pcms
//
//  Created by xujunquan on 16/10/20.
//  Copyright © 2016年 cig. All rights reserved.
//

#import "FFBaseEmptyView.h"
#import "FFBaseTools.h"
#import "Masonry.h"
#import "ReactiveCocoa.h"

@interface FFBaseEmptyView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *contentSubLabel;
@end

@implementation FFBaseEmptyView
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
    [self addSubview:self.contentSubLabel];
    
    //设置图片压缩优先级低，则图片被压缩显示，不会造成label无法显示的状况,重要方法
    [self.imageView setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.right.equalTo(self);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
    }];
    
    [self.contentSubLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(10);
        make.bottom.lessThanOrEqualTo(self).offset(0);
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
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textColor = [UIColor grayColor];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentLabel;
}

- (UILabel *)contentSubLabel {
    if (!_contentSubLabel) {
        _contentSubLabel = [UILabel new];
        _contentSubLabel.font = [UIFont systemFontOfSize:14];
        _contentSubLabel.textColor = [UIColor grayColor];
        _contentSubLabel.textAlignment = NSTextAlignmentCenter;
        _contentSubLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    return _contentSubLabel;
}

#pragma mark- set
- (void)setContentText:(NSString *)contentText {
    _contentText = contentText;
    self.contentLabel.text = contentText;
}

- (void)setContentSubText:(NSString *)contentSubText {
    _contentSubText = contentSubText;
    self.contentSubLabel.text = contentSubText;
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
    [self.contentSubLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@(bottomSpace));
    }];
}

- (void)setBetSpace1:(float)betSpace1 {
    _betSpace1 = betSpace1;
    [self.contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(betSpace1);
    }];
}

- (void)setBetSpace2:(float)betSpace2 {
    _betSpace2 = betSpace2;
    [self.contentSubLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(betSpace2);
    }];
}
@end
