//
//  UITableView+FFCommon.m
//  FFObjC
//
//  Created by xujunquan on 16/12/6.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "UITableView+FFCommon.h"
#import <objc/runtime.h>

@implementation UITableView (FFCommon)
- (id)cellForReuseIdentifier:(NSString *)identifier{
    NSAssert(identifier.length > 0, @"Expect a valid identifier - %@", identifier);
    NSMutableDictionary *templateCellsByIdentifiers = objc_getAssociatedObject(self, _cmd);
    if (!templateCellsByIdentifiers) {
        templateCellsByIdentifiers = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, templateCellsByIdentifiers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    UITableViewCell *templateCell = templateCellsByIdentifiers[identifier];
    if (!templateCell) {
        templateCell = [self dequeueReusableCellWithIdentifier:identifier];
        NSAssert(templateCell != nil, @"Cell must be registered to table view for identifier - %@", identifier);
        templateCell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        templateCellsByIdentifiers[identifier] = templateCell;
    }
    [templateCell prepareForReuse];
    return templateCell;
}

@end
