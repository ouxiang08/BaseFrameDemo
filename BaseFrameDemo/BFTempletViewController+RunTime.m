//
//  BFTempletViewController+RunTime.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/14.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFTempletViewController+RunTime.h"
#import <objc/runtime.h>

static NSString *const kMyCustomView = @"kMyCustomView";

@implementation BFTempletViewController (RunTime)

@dynamic image;
@dynamic myCustomView;

- (void)setMyCustomView:(UIView *)customView {
    [self willChangeValueForKey:@"myCustomView"];
    objc_setAssociatedObject(self, &kMyCustomView, customView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"myCustom"];
}

- (UIView *)myCustomView {
    return objc_getAssociatedObject(self, &kMyCustomView);
}

@end
