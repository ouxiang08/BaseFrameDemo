//
//  UINavigationController+CompletionHandler.m
//  LiFang
//
//  Created by muma on 16/9/23.
//  Copyright © 2016年 Lifang. All rights reserved.
//

#import "UINavigationController+CompletionHandler.h"

@implementation UINavigationController (CompletionHandler)

- (void)popViewControllerAnimated:(BOOL)animated completion:(void (^)())completion {
    [CATransaction begin];
    [CATransaction setCompletionBlock:completion];
    [self popViewControllerAnimated:animated];
    [CATransaction commit];
}

@end
