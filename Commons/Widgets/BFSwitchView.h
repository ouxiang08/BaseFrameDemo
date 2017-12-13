//
//  CHCSwitchView.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/7/5.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BFSwitchView : UIView

@property (nonatomic, copy) void (^onSelectedIndex)(NSInteger index);

@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) UIColor *highlightedColor;

@property (nonatomic) NSInteger currentIndex;

- (instancetype)initWithTitleArray:(NSArray *)array;

@end
