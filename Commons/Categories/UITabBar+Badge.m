//
//  UITabBar+Badge.m
//  LiFang
//
//  Created by yanmingxin on 16/8/4.
//  Copyright © 2016年 Lifang. All rights reserved.
//

#import "UITabBar+Badge.h"

@implementation UITabBar (Badge)

- (void)showBadgeOnItemIndex:(int)index corner:(CGFloat)corner {
    [self removeBadgeOnItemIndex:index];
    /*
    UIView *badgeView = [[UIView alloc] init];
    badgeView.tag = 666 + index;
    badgeView.layer.borderColor = kHRGB(0xF9F9F9).CGColor;
    badgeView.layer.borderWidth = 1;
    badgeView.layer.cornerRadius = corner;
    badgeView.backgroundColor = kHRGB(0xedba11);
     */
    CGFloat wh = corner * 2;
    CGFloat percentX = (index + 0.56) / self.items.count;
    CGFloat x = percentX * CGRectGetWidth(self.frame);
    CGFloat y = CGRectGetHeight(self.frame) * 0.10;
    
//    TWBadgeView *badgeView = [[TWBadgeView alloc] initWithFrame:CGRectMake(x, y, wh, wh)];
//    badgeView.tag = 888 + index;
//    badgeView.borderColor = kHRGB(0xF9F9F9);
//    badgeView.borderWidth = 1.0f;
//    badgeView.badgeColor = kHRGB(0xff5b49);
//    
//    [self addSubview:badgeView];
}

- (void)removeBadgeOnItemIndex:(int)index {
    UIView * badgeView = [self viewWithTag:(888 + index)];
    [badgeView removeFromSuperview];
}
@end
