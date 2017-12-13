
//
//  AppMacro.h
//  CHBaseFrame
//  App相关的宏定义
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define LFBaseViewBackgroundColor   kHRGB(0xf5f5f5)
#define CHCAppBaseGrayColor      kHRGB(0x4e4e4e)
#define CHCAppBaseColor      kHRGB(0xFF5452)
#define CHCAppBaseColorA(alpha)      kHRGBA(0xFF5452, alpha)
#define CHCAppNavColor       kRGB(105, 105, 105)
#define CHCAppRedColor       kRGB(255, 90, 95)
#define CHCAppExtendColor    kHRGB(0xff8b00)
#define CHCAppPlaceholderColor kHRGB(0x999999)

#define CHCAppBaseButtonTitleColor      kHRGB(0x92A7C3)

#define LFHostBaseViewBackgroundColor   kHRGB(0xf5f5f5)
#define CHCAppHostBaseColor  kHRGB(0x4081d6)

#define kAdaptFont(fsize, name) [UIFont fontWithName:name size:fsize*kDeviceWidthScaleToiPhone6]
#define kAppAdaptFont(size) [UIFont systemFontOfSize:size*kDeviceWidthScaleToiPhone6]
#define kAppAdaptFontBold(size) [UIFont boldSystemFontOfSize:size*kDeviceWidthScaleToiPhone6]

#define kAppAdaptHeight(height) (((NSInteger)((height) * kDeviceWidthScaleToiPhone6 * kAppScale)) / kAppScale)
#define kAppAdaptWidth(width) (((NSInteger)((width) * kDeviceWidthScaleToiPhone6 * kAppScale)) / kAppScale)

#define kAppSepratorLineHeight (1.0 / kAppScale)

#define kSSKeychainServiceName    @"WKZFKeychainServiceName";
#define kSSKeychainAccountName    @"WKZFKeychainAccountName";
#define kSSKeychainPassword       @"WKZFKeychainPassword";
#define kSSKeychainLabel          @"WKZFKeychainLabel";

#define ALL_MARGIN              10
#define ALL_MARGIN_5            5
#define ALL_MARGIN_10           10
#define ALL_MARGIN_15           15
#define kAllAdaptMargin         kAppAdaptWidth(15)

#define ALL_FONT_SIZE           kAppFont(14)
#define ALL_TITLE_SIZE          kAppFont(16)
#define ALL_DETAIL_SIZE         kAppFont(12)

#define ALL_CORNERRADIUS        4
#define ALL_CORNERRADIUS_4      4
#define ALL_CORNERRADIUS_6      6
#define ALL_CORNERRADIUS_8      8

#define ALL_BORDER_COLOR        kHRGB(0xe4e4e4)

#define ALL_LINE_COLOR          kHRGB(0xe4e4e4)

#define kAppURL @""
#endif /* AppMacro_h */
