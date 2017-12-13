//
//  CHCStepper.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/29.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFStepper.h"
#import "UIFactory.h"
#import "UtilsMacro.h"

@implementation BFStepper {
    UIButton *_minusButton, *_plusButton;
    UILabel *_numberLabel;
    NSInteger _number;
}

+ (instancetype)defaultSepperWithOrigin:(CGPoint)origin {
  return  [[self alloc] initWithFrame:CGRectMake(origin.x, origin.y, kCHCStepperWidth, kCHCStepperHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self _initial];
    }
    return self;
}

- (void)_initial {
    
    self.layer.cornerRadius = 3;
    self.layer.borderColor = kHRGB(0xCCCCCC).CGColor;
    self.layer.borderWidth = 1;
    
    _number = 1;
    
    _minusButton = UIButtonImageFactory([UIImage imageNamed:@"mall_icon_minus"], [UIImage imageNamed:@"mall_icon_minus_pre"], self, @selector(handleSubtract:));
    _minusButton.frame = CGRectMake(0, 0, kCHCStepperItemWidth - 1, kCHCStepperHeight);
    [self addSubview:_minusButton];
    
    UIView *vLeftLine = [[UIView alloc] initWithFrame:CGRectMake(kCHCStepperItemWidth - 1, 0, 1, kCHCStepperHeight)];
    vLeftLine.backgroundColor = kHRGB(0xCCCCCC);
    [self addSubview:vLeftLine];
    
    _plusButton = UIButtonImageFactory([UIImage imageNamed:@"mall_icon_plus"], [UIImage imageNamed:@"mall_icon_plus"], self, @selector(handleAdd:));
    _plusButton.frame = CGRectMake(kCHCStepperWidth - kCHCStepperItemWidth, 0, kCHCStepperItemWidth - 1, kCHCStepperHeight);
    [self addSubview:_plusButton];
    
    UIView *vRightLine = [[UIView alloc] initWithFrame:CGRectMake(kCHCStepperWidth - kCHCStepperItemWidth - 1, 0, 1, kCHCStepperHeight)];
    vRightLine.backgroundColor = kHRGB(0xCCCCCC);
    [self addSubview:vRightLine];
    
    _numberLabel = UILabelAlignmentFactory(@"1", kHRGB(0x333333), kAppFont(14), NSTextAlignmentCenter);
    _numberLabel.frame = CGRectMake(kCHCStepperItemWidth, 0, kCHCStepperWidth - kCHCStepperItemWidth * 2, kCHCStepperHeight);
    [self addSubview:_numberLabel];
}

- (NSInteger)countOfGoods {
    return _number;
}

- (void)setCountOfGoods:(NSInteger)countOfGoods {
    _number = countOfGoods;
    _numberLabel.text = [NSString stringWithFormat:@"%d",(int)_number];
}

- (void)handleSubtract:(id)seder {
    if (_number > 1) {
        _number--;
        [self refreshNumber];
    }
    _minusButton.selected = _number > 1;
    if (self.onCalculate) {
        self.onCalculate(_number);
    }
}

- (void)handleAdd:(id)sender {
    _number ++;
    _minusButton.selected = _number > 1;
    [self refreshNumber];
    if (self.onCalculate) {
        self.onCalculate(_number);
    }
}

- (void)refreshNumber {
    [UIView animateWithDuration:0.1 animations:^{
        _numberLabel.text = [NSString stringWithFormat:@"%d",(int)_number];
    }];
}

@end
