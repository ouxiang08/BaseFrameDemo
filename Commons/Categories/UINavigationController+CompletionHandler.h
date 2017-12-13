//
//  UINavigationController+CompletionHandler.h
//  LiFang
//
//  Created by muma on 16/9/23.
//  Copyright © 2016年 Lifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (CompletionHandler)

- (void)popViewControllerAnimated:(BOOL)animated completion:(void (^)())completion;

@end
