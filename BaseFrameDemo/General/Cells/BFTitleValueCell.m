//
//  BFTitleValueCell.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/11/20.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTitleValueCell.h"
#import "UIView+ConvenienceFrame.h"
#import "NSString+Utilities.h"
#import "Macro.h"

@implementation BFTitleValueCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.font = kAppAdaptFont(14);
        [_contentView addSubview:_valueLabel];
        [self layoutValueLabel:NO];
    }
    return self;
}

- (void)setValue:(NSString *)value {
    _value = value;
    if ([NSString isNullOrEmpty:value]) {
        _valueLabel.textColor = kHRGB(0x999999);
        _valueLabel.text = _placeholder;
    }
    else {
        _valueLabel.text = value;
        _valueLabel.textColor = CHCAppBaseGrayColor;
    }
}

- (void)setAccessoryType:(UITableViewCellAccessoryType)accessoryType {
    if (accessoryType==UITableViewCellAccessoryNone) {
        [self layoutValueLabel:NO];
    }
    else {
        [self layoutValueLabel:YES];
    }
    return [super setAccessoryType:accessoryType];
}

- (void)setLeftSpacing:(CGFloat)leftSpacing {
    _leftSpacing = leftSpacing;
    _valueLabel.frame = CGRectMake(_titleLabel.maxX + _leftSpacing, 10, kDeviceWidth - _rightSpacing - _titleLabel.maxX - _leftSpacing, 24);
}

- (void)setRightSpacing:(CGFloat)rightSpacing {
    _rightSpacing = rightSpacing;
    _valueLabel.frame = CGRectMake(_titleLabel.maxX + _leftSpacing, 10, kDeviceWidth - _rightSpacing - _titleLabel.maxX - _leftSpacing, 24);
}

- (void)layoutValueLabel :(BOOL) rightSpacing {
    [self setRightSpacing:rightSpacing?34:16];
}

- (void)setAccessoryView:(UIView *)accessoryView {
    if (accessoryView) {
        [self layoutValueLabel:YES];
    }
    else {
        [self layoutValueLabel:NO];
    }
    return [super setAccessoryView:accessoryView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _valueLabel.frame = CGRectMake(_titleLabel.maxX + _leftSpacing, 10, kDeviceWidth - _rightSpacing - _titleLabel.maxX - _leftSpacing, 24);
}

- (void)setPlaceholder:(NSString *)placeholder {
    _placeholder = placeholder;
    [self setNeedsLayout];
}

@end
