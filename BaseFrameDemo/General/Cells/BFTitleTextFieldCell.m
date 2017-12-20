//
//  BFTitleTextFieldCell.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/17.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTitleTextFieldCell.h"
#import "UIView+ConvenienceFrame.h"
#import "UtilsMacro.h"

@implementation BFTitleTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _textField = [[BFTextField alloc] initWithFrame:CGRectMake(_titleLabel.x + _titleLabel.width, 10, kDeviceWidth - 44 - _titleLabel.x - _titleLabel.width, 24)];
        _textField.textColor = kHRGB(0x4e4e4e);
        _textField.font = kAppFont(14);
        _textField.delegate = self;
        _textField.placeholderColor = kHRGB(0x999999);
        [_contentView addSubview:_textField];
        [_textField addTarget:(id)self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (BFTextField *)textField {
    return _textField;
}

- (void)setPlaceholder:(NSString *)placeholder {
    _textField.placeholder = placeholder;
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType {
    _textField.keyboardType = keyboardType;
}

- (void)setEditEnabled:(BOOL)editEnabled {
    _textField.enabled = editEnabled;
}

- (void)setValue:(NSString *)value {
    _textField.text = value;
}

- (NSString *)value {
    return _textField.text;
}

- (void)setReturnKeyType:(UIReturnKeyType)returnKeyType {
    _textField.returnKeyType = returnKeyType;
}

- (BOOL)becomeFirstResponder {
    return [_textField becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    return [_textField resignFirstResponder];
}

- (void)textFieldDidChange:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldTextDidChange:cell:)]) {
        [self.delegate textFieldTextDidChange:textField cell:self];
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

- (void)setRightSpacing:(CGFloat)rightSpacing {
    _rightSpacing = rightSpacing;
    _textField.frame = CGRectMake(_titleLabel.maxX + _leftSpacing, 10, kDeviceWidth - _leftSpacing - _rightSpacing - _titleLabel.maxX - 8, 24);
}

- (void)setLeftSpacing:(CGFloat)leftSpacing {
    _leftSpacing = leftSpacing;
    _textField.frame = CGRectMake(_titleLabel.maxX + _leftSpacing, 10, kDeviceWidth - _leftSpacing - _rightSpacing - _titleLabel.maxX - 8, 24);
}

- (void)layoutValueLabel :(BOOL) rightSpacing {
    [self setRightSpacing:rightSpacing ? 34 : 16];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _textField.frame = CGRectMake(_titleLabel.maxX + _leftSpacing, 10, kDeviceWidth - _leftSpacing - _rightSpacing - _titleLabel.maxX - 8, 24);
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

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

#pragma mark

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:cell:)]) {
        [self.delegate textFieldDidBeginEditing:textField cell:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidEndEditing:cell:)]) {
        [self.delegate textFieldDidEndEditing:textField cell:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldShouldReturn:cell:)]) {
        return [self.delegate textFieldShouldReturn:textField cell:self];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:cell:)]) {
        return [self.delegate textField:textField shouldChangeCharactersInRange:range replacementString:string cell:self];
    }
    return YES;
}

@end

