//
//  BFImageTextFieldCell.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/17.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFImageTextFieldCell.h"
#import "Macro.h"

@implementation BFImageTextFieldCell {
    UIView *_contentView;
    UIImageView *_imageView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 44)];
        _contentView.backgroundColor = kWhiteColor;
        [self.contentView addSubview:_contentView];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(ALL_MARGIN_15, 10, 54, 24)];
        _imageView.contentMode = UIViewContentModeCenter;
        [_contentView addSubview:_imageView];
        
        _textField = [[BFTextField alloc] initWithFrame:CGRectMake(_imageView.x + _imageView.width, 10, kDeviceWidth - 44 - _imageView.x - _imageView.width, 24)];
        _textField.textColor = kHRGB(0x4e4e4e);
        _textField.font = kAppAdaptFont(14);
        _textField.delegate = self;
        _textField.placeholderColor = kHRGB(0x999999);
        [_textField addTarget:(id)self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        [_contentView addSubview:_textField];
    }
    return self;
}

- (UIImageView *)imageView {
    return _imageView;
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    _imageView.image = [UIImage imageNamed:imageName];
}
- (UITextField *)textField {
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
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldTextDidChange:imageCell:)]) {
        [self.delegate textFieldTextDidChange:textField imageCell:self];
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
    _textField.frame = CGRectMake(_imageView.maxX + _leftSpacing, 10, kDeviceWidth - _leftSpacing - _rightSpacing - _imageView.maxX - 8, 24);
}

- (void)setLeftSpacing:(CGFloat)leftSpacing {
    _leftSpacing = leftSpacing;
    _textField.frame = CGRectMake(_imageView.maxX + _leftSpacing, 10, kDeviceWidth - _leftSpacing - _rightSpacing - _imageView.maxX - 8, 24);
}

- (void)layoutValueLabel :(BOOL) rightSpacing {
    [self setRightSpacing:rightSpacing ? 34 : 16];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _textField.frame = CGRectMake(_imageView.maxX + _leftSpacing, 10, kDeviceWidth - _leftSpacing - _rightSpacing - _imageView.maxX - 8, 24);
}

//- (void)setAccessoryView:(UIView *)accessoryView {
//    if (accessoryView) {
//        [self layoutValueLabel:YES];
//    }
//    else {
//        [self layoutValueLabel:NO];
//    }
//    return [super setAccessoryView:accessoryView];
//}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

#pragma mark

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidBeginEditing:imageCell:)]) {
        [self.delegate textFieldDidBeginEditing:textField imageCell:self];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidEndEditing:imageCell:)]) {
        [self.delegate textFieldDidEndEditing:textField imageCell:self];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldShouldReturn:imageCell:)]) {
        return [self.delegate textFieldShouldReturn:textField imageCell:self];
    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if (self.delegate && [self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:imageCell:)]) {
        return [self.delegate textField:textField shouldChangeCharactersInRange:range replacementString:string imageCell:self];
    }
    return YES;
}

@end
