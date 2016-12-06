//
//  UITableView+FFCommon.h
//  FFObjC
//
//  Created by xujunquan on 16/12/6.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (FFCommon)
///根据id获取cell
- (id)cellForReuseIdentifier:(NSString *)identifier;

@end
