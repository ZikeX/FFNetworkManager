//
//  DZNEmptyView.h
//  Pcms
//
//  Created by xujunquan on 16/10/20.
//  Copyright © 2016年 cig. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFBaseEmptyView : UIView
@property (nonatomic, copy) NSString *contentText;
@property (nonatomic, copy) NSString *contentSubText;
@property (nonatomic, copy) NSString *contentImage;

@property (nonatomic, assign) float topSpace;
@property (nonatomic, assign) float bottomSpace;
@property (nonatomic, assign) float betSpace1;
@property (nonatomic, assign) float betSpace2;

///子类在此方法中进行自定义
- (void)ff_addSubViewAndConstraints;

@end
