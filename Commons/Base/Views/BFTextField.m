//
//  BFTextField.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/13.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTextField.h"
#import "UIView+ConvenienceFrame.h"
#import "UtilsMacro.h"

@implementation BFTextField

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _placeholderColor = kRGB(195, 195, 195);
        _placeholderAlilgnment = BFTextFieldPlaceholderAlignmentLeft;
    }
    return self;
}

- (void) drawPlaceholderInRect:(CGRect)rect {
    if (_placeholderColor) {
        CGSize textSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
        CGFloat x = 0;
        if (_placeholderAlilgnment == BFTextFieldPlaceholderAlignmentCenter) {
            CGSize placeholderSize = [self.placeholder sizeWithAttributes:@{NSFontAttributeName:self.font}];
            x = MAX(0, (self.width - placeholderSize.width) / 2);
        }
        else if (_placeholderAlilgnment == BFTextFieldPlaceholderAlignmentRight) {
            CGSize placeholderSize = [self.placeholder sizeWithAttributes:@{NSFontAttributeName:self.font}];
            x = MAX(0, (self.width - placeholderSize.width));
        }
        [self.placeholder drawAtPoint:CGPointMake(x, (rect.size.height / 2 - textSize.height / 2 - .5))
                       withAttributes:@{NSFontAttributeName:self.font,NSForegroundColorAttributeName:_placeholderColor}];
    }
    else {
        [super drawPlaceholderInRect:rect];
    }
}

@end
