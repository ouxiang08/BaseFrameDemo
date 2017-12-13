//
//  UIImage+Device.m
//  LiFang
//
//  Created by Hugo Wang on 15/12/8.
//  Copyright © 2015年 Lifang. All rights reserved.
//

#import "UIImage+Device.h"
#import "TWDeviceUtilities.h"

@implementation UIImage (Device)

+ (UIImage *)lf_imagePNGWithDeferenceDevices:(NSString *)imageName {
    return [self lf_imageWithDeferenceDevice:imageName type:@"png"];
}

+ (UIImage *)lf_imageJPGWithDeferenceDevices:(NSString *)imageName {
    return [self lf_imageWithDeferenceDevice:imageName type:@"jpg"];
}

+ (UIImage *)lf_imageWithDeferenceDevice:(NSString *)imageName type:(NSString *)type {
    NSString *newName = nil;
    if ([[TWDeviceUtilities sharedInstance] iPhone4]) {
        newName = [NSString stringWithFormat:@"%@-4s.%@", imageName, type];
    }
    else if ([[TWDeviceUtilities sharedInstance] iPhone5]) {
        newName = [NSString stringWithFormat:@"%@-5s.%@", imageName, type];
    }
    else if ([[TWDeviceUtilities sharedInstance] iPhone6]) {
        newName = [NSString stringWithFormat:@"%@-6s.%@", imageName, type];
    }
    else if ([[TWDeviceUtilities sharedInstance] iPhonePlus]) {
        newName = [NSString stringWithFormat:@"%@-6p.%@", imageName, type];
    }
    return [UIImage imageNamed:newName];
}

@end
