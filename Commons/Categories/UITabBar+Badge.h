//
//  UITabBar+Badge.h
//  LiFang
//
//  Created by yanmingxin on 16/8/4.
//  Copyright © 2016年 Lifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItemIndex:(int)index corner:(CGFloat)corner;
- (void)removeBadgeOnItemIndex:(int)index;
@end
