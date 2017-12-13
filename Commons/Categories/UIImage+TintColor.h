//
//  UIImage+TintColor.h
//  EasyBaking
//
//  Created by Chris on 2/4/15.
//  Copyright (c) 2015 iEasyNote. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (TintColor)

- (UIImage *)tintedImageWithColor:(UIColor *)tintColor;

+ (UIImage *)imageWithView:(UIView*) view;

@end
