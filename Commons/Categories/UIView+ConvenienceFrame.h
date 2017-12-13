//
//  UIView+ConvenienceFrame.h
//  LiFang
//
//  Created by Hugo Wang on 15/11/5.
//  Copyright © 2015年 Lifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ConvenienceFrame)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat maxY;

@property (nonatomic, assign) CGFloat maxX;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat top;

@property (nonatomic, assign) CGFloat right;

@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;

@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGPoint origin;

@property (nonatomic, assign) CGSize size;

@property (nonatomic, retain) UIColor *borderColor;

@property (nonatomic, readonly) UIViewController *viewController;

- (void)centerInSuperView;
- (void)aestheticCenterInSuperView;

- (UIImage *)imageForView;

@end
