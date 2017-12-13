//
//  BFTagView.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/7/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTagView.h"
#import "NSString+Utilities.h"
#import "UIView+ConvenienceFrame.h"
#import "UIFactory.h"
#import "Macro.h"

static float kTagButtonHeight = 30.0f;
static float kTagButtonInterval = 12.0f;
static float kClearButtonWidth = 40.0f;

#define BFAppBaseColor kRandomColor

@implementation BFTagView {
    NSString *_title;
    NSArray *_items;
    UIButton *_clearButton;
}

- (instancetype)initWithItems:(NSArray *)items {
    _items = items;
    return [self initWithFrame:CGRectMake(0, 0, kDeviceWidth, [[self class] contentHeight:items])];
}

- (instancetype)initWithTitle:(NSString *)title items:(NSArray *)items {
    _title = title;
    _items = items;
    return [self initWithFrame:CGRectMake(0, 0, kDeviceWidth, [[self class] contentHeight:items])];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initial];
    }
    return self;
}

- (void)_initial {
    
    self.backgroundColor = kWhiteColor;
    
    CGFloat originX = ALL_MARGIN_15;
    CGFloat originY = ALL_MARGIN_15;
    if (![NSString isNullOrEmpty:_title]) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ALL_MARGIN_15, ALL_MARGIN_15, kDeviceWidth - ALL_MARGIN_15 * 2 - kClearButtonWidth, 21)];
        titleLabel.textColor = kHRGB(0x4E4E4E);
        titleLabel.font = kAppFont(13.0f);
        titleLabel.text = _title;
        [self addSubview:titleLabel];
        originY = titleLabel.frame.size.height + 20;
        
        _clearButton = UIButtonTitleFactory(@"清空", kHRGB(0x757575), kAppFont(13.0f), self, @selector(handleClear:));
        _clearButton.frame= CGRectMake(kDeviceWidth - kClearButtonWidth - ALL_MARGIN_15, ALL_MARGIN_15, kClearButtonWidth, 21);
        _clearButton.hidden = YES;
        [self addSubview:_clearButton];
    }

    for (int i = 0; i < _items.count; i++) {
        NSString *title = _items[i];
        if (originX + [[self class]  titleWidth:title] > kDeviceWidth - ALL_MARGIN_15) {
            originX = ALL_MARGIN_15;
            originY += kTagButtonHeight + kTagButtonInterval;
        }
        UIButton *button = [self buttonWithOrigin:CGPointMake(originX, originY) andTitle:title];
        if (self.tagType == BFTagSelectdType && i == 0) {
            button.selected = YES;
        }
        button.tag = 1000 + i +1;
        [self addSubview:button];
        originX += [[self class]  buttonWidth:title] + 7.5;
    }
    
    self.height = originY + kTagButtonHeight + kTagButtonInterval;
}

- (void)reloadData:(NSArray *)items {

    if (items.count) {
        if (self.subviews.count) {
            for (UIView *view in self.subviews) {
                [view removeFromSuperview];
            }
        }
        _items = items;
        [self _initial];
    }
}

- (UIButton *)buttonWithOrigin:(CGPoint)origin andTitle:(NSString *)title {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(origin.x, origin.y, [[self class] buttonWidth:title], 30)];
    button.layer.cornerRadius = 4.0f;
    button.titleLabel.font = kAppFont(14);
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button setTitle:title forState:UIControlStateNormal];
    if (self.tagType == BFTagShowType) {
        button.backgroundColor = kHRGB(0xF5F5F5);
        [button setTitleColor:kHRGB(0x4E4E4E) forState:UIControlStateNormal];
        [button setTitleColor:BFAppBaseColor forState:UIControlStateSelected];
    }
    else if (self.tagType == BFTagSelectdType) {
        button.backgroundColor = kWhiteColor;
        [button setTitleColor:BFAppBaseColor forState:UIControlStateNormal];
        [button setTitleColor:kWhiteColor forState:UIControlStateSelected];
        button.layer.borderColor = BFAppBaseColor.CGColor;
        button.layer.borderWidth = 1.0f;
        button.layer.cornerRadius = 3;
        //[button setBackgroundColor:BFAppBaseColor forState:UIControlStateSelected];
        //[button setBackgroundColor:kWhiteColor forState:UIControlStateNormal];
    }
    [button addTarget:self action:@selector(onSelected:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)onSelected:(UIButton *)sender {
    NSInteger index = sender.tag % 1000 - 1;
    if (self.tagType == BFTagSelectdType) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[UIButton class]]) {
                UIButton *button = (UIButton *)view;
                if (sender.tag == button.tag) {
                    button.selected = YES;
                }
                else {
                    button.selected = NO;
                }
            }
        }
    }
    if (self.didSelectedTagInView) {
        self.didSelectedTagInView(_items[index]);
    }
    if (self.didSelectedIndexInView) {
        self.didSelectedIndexInView(index);
    }
}

- (void)handleClear:(id)sender {
    if (self.onClear) {
        self.onClear();
    }
}

- (void)setIsShowClear:(BOOL)isShowClear {
    _isShowClear = isShowClear;
    _clearButton.hidden = !_isShowClear;
}

+ (CGFloat)titleWidth:(NSString *)title {
    return [title returnSize:kAppFont(14.0f) MaxWidth:kDeviceWidth - ALL_MARGIN_15 * 3].width;
}

+ (CGFloat)buttonWidth:(NSString *)title {
    return [self titleWidth:title] + ALL_MARGIN_15 * 2;
}

+ (CGFloat)contentHeight:(NSArray *)items {
    CGFloat originX = ALL_MARGIN_15;
    CGFloat originY = ALL_MARGIN_15;
    for (int i = 0; i < items.count; i++) {
        NSString *title = items[i];
        if (originX + [self buttonWidth:title] > kDeviceWidth - ALL_MARGIN_15) {
            originX = ALL_MARGIN_15;
            originY += kTagButtonHeight + kTagButtonInterval;
        }
        originX += [self buttonWidth:title] + 7.5;
    }
    originY += kTagButtonHeight + kTagButtonInterval;
    return originY;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
