//
//  FFBaseTableViewCell.m
//  FFObjC
//
//  Created by xujunquan on 16/10/19.
//  Copyright © 2016年 org_ian. All rights reserved.
//

#import "FFBaseTableViewCell.h"

@implementation FFBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self ff_addSubViewAndConstraints];
    }
    return self;
}

- (void)ff_addSubViewAndConstraints {
    
}


@end
