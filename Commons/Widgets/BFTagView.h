//
//  BFTagView.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/7/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BFTagTypeView) {
    BFTagShowType = 0,
    BFTagSelectdType = 1
};

@interface BFTagView : UIView

@property (nonatomic) BFTagTypeView tagType;

@property (nonatomic, assign) BOOL isShowClear;

@property (nonatomic, copy) void (^didSelectedTagInView)(NSString *keyword);

@property (nonatomic, copy) void (^didSelectedIndexInView)(NSInteger index);

@property (nonatomic, copy) void (^onClear)();


+ (CGFloat)contentHeight:(NSArray *)items;

- (instancetype)initWithItems:(NSArray *)items;

- (instancetype)initWithTitle:(NSString *)title items:(NSArray *)items;

- (void)reloadData:(NSArray *)items;

@end
