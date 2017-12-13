//
//  CHCStepper.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/29.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

static float kCHCStepperHeight = 30.0f;
static float kCHCStepperWidth = 95.0f;
static float kCHCStepperItemWidth = 33.0f;


@interface BFStepper : UIView

@property (nonatomic) NSInteger countOfGoods;

@property (nonatomic, copy) void (^onCalculate)(NSInteger number);

+ (instancetype)defaultSepperWithOrigin:(CGPoint)origin;

//- (NSInteger)countOfGoods;

@end
