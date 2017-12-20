//
//  BFTitleCell.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/17.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTitleCell.h"
#import "NSString+Utilities.h"
#import "Macro.h"

@implementation BFTitleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = kWhiteColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 44)];
        _contentView.backgroundColor = kWhiteColor;
        [self.contentView addSubview:_contentView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ALL_MARGIN_15, 10, 54, 24)];
        _titleLabel.font = kAppFont(14);
        _titleLabel.textColor = CHCAppBaseGrayColor;
        [_contentView addSubview:_titleLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self resize];
}

- (void)resize {
    CGFloat width = [_titleLabel.text widthForContentWithFontSize:[UIFont systemFontOfSize:14]];
    _titleLabel.frame = CGRectMake(ALL_MARGIN_15, 10, width + ALL_MARGIN_15 * 2, 24);
}

- (UILabel *)titleLabel {
    return _titleLabel;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _titleLabel.text = title;
    [self resize];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */


@end
