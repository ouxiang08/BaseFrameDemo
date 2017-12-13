//
//  BFSwitchView.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/7/5.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFSwitchView.h"
#import "NSString+Utilities.h"
#import "Macro.h"

#define BFAppBaseColor kRandomColor

static float kSwitchViewHeight = 44.0f;

@implementation BFSwitchView {
    NSArray *_titles;
    UIView *_bottomLineView;
    NSInteger _oldIndex;
}

@synthesize titleColor = _titleColor;
@synthesize highlightedColor = _highlightedColor;
@synthesize titleFont = _titleFont;

- (instancetype)initWithTitleArray:(NSArray *)array {
    _titles = array;
  return  [self initWithFrame:CGRectMake(0, 0, kDeviceWidth, kSwitchViewHeight)];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self _initial];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initial];
    }
    return self;
}

- (void)_initial {
    _oldIndex = 0;
    self.backgroundColor = kWhiteColor;
    if (_titles && _titles.count) {
        for (NSInteger i = 0; i < _titles.count; i++) {
            UIButton *button = [self buttonWithOrigin:CGPointMake([self buttonWidth] * i, 0)];
            button.tag = 1000 + i;
            button.selected = (i == 0);
            [button setTitle:_titles[i] forState:UIControlStateNormal];
            [self addSubview:button];
        }
        
        CGFloat titleWidth = [_titles[0] returnSize:self.titleFont MaxWidth:[self buttonWidth]].width;
        _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(([self buttonWidth] - titleWidth) / 2, kSwitchViewHeight - 2 , titleWidth, 2)];
        _bottomLineView.backgroundColor = BFAppBaseColor;
        [self addSubview:_bottomLineView];
        
        UIView *separateLine = [[UIView alloc] initWithFrame:CGRectMake(0, kSwitchViewHeight - kAppSepratorLineHeight , kDeviceWidth, kAppSepratorLineHeight)];
        separateLine.backgroundColor = kHRGB(0xdddddd);
        [self addSubview:separateLine];
    }
}

- (UIButton *)buttonWithOrigin:(CGPoint)origin {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(origin.x, origin.y, [self buttonWidth], kSwitchViewHeight)];
    button.titleLabel.font = self.titleFont;
    [button addTarget:self action:@selector(handleSelectedAction:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:self.titleColor forState:UIControlStateNormal];
    [button setTitleColor:self.highlightedColor forState:UIControlStateSelected];
    return button;
}

- (CGFloat)buttonWidth {
    return kDeviceWidth / _titles.count;
}

- (void)handleSelectedAction:(id)sender {
    UIButton *button = (UIButton *)sender;
    NSInteger index = button.tag % 1000;
    if (index != _oldIndex) {
        button.selected = !button.selected;
        if (_oldIndex >= 0) {
            UIButton *preButton = (UIButton *)[self viewWithTag:1000 + _oldIndex];
            preButton.selected = !preButton.selected;
            _oldIndex = index;
        }
    }
    if (self.onSelectedIndex) {
        self.onSelectedIndex(index);
    }
    [self animationBottomLine:index];
}

- (void)setCurrentIndex:(NSInteger)currentIndex {
    _currentIndex = currentIndex;
    
    UIButton *button = (UIButton *)[self viewWithTag:1000 + _currentIndex];
    NSInteger index = button.tag % 1000;
    if (index != _oldIndex) {
        button.selected = !button.selected;
        if (_oldIndex >= 0) {
            UIButton *preButton = (UIButton *)[self viewWithTag:1000 + _oldIndex];
            preButton.selected = !preButton.selected;
            _oldIndex = index;
        }
    }
    
    [self animationBottomLine:_currentIndex];
}

- (void)animationBottomLine:(NSInteger)index {
    CGFloat titleWidth = [_titles[index] returnSize:self.titleFont MaxWidth:[self buttonWidth]].width;
    [UIView animateWithDuration:0.2 animations:^{
        _bottomLineView.frame = CGRectMake([self buttonWidth] * index + ([self buttonWidth] - titleWidth) / 2, kSwitchViewHeight - 2, titleWidth, 2);
    } completion:^(BOOL finished) {}];
}

- (UIColor *)titleColor {
    if (!_titleColor) {
        _titleColor = kHRGB(0x333333);
    }
    return _titleColor;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
}

- (UIColor *)highlightedColor {
    if (!_highlightedColor) {
        _highlightedColor = BFAppBaseColor;
    }
    return _highlightedColor;
}

- (void)setHighlightedColor:(UIColor *)highlightedColor {
    _highlightedColor = highlightedColor;
}

- (UIFont *)titleFont {
    if (!_titleFont) {
        _titleFont = kAppFont(14.0f);
    }
    return _titleFont;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    if (_titles && _titles.count) {
        for (NSInteger i = 0; i < _titles.count; i++) {
            UIButton *button = (UIButton *)[self viewWithTag:1000 + i];
            button.titleLabel.font = self.titleFont;
        }
    }
}

@end
