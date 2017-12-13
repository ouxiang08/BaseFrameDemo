//
//  UIImage+Device.h
//  LiFang
//
//  Created by Hugo Wang on 15/12/8.
//  Copyright © 2015年 Lifang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Device)

+ (UIImage *)lf_imagePNGWithDeferenceDevices:(NSString *)imageName;

+ (UIImage *)lf_imageJPGWithDeferenceDevices:(NSString *)imageName;

@end
