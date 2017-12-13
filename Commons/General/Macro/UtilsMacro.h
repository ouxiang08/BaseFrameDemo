
//
//  UtilsMacro.h
//  CHBaseFrame
//  工具宏定义
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#ifndef UtilsMacro_h
#define UtilsMacro_h


#ifndef kDeviceScale
#define kDeviceScale ([[UIScreen mainScreen] scale])
#endif

#ifndef kDeviceWidth
#define kDeviceWidth ([[UIScreen mainScreen] bounds].size.width)
#endif

#ifndef kDeviceHeight
#define kDeviceHeight ([[UIScreen mainScreen] bounds].size.height)
#endif

#ifndef kAppFrame
#define kAppFrame [[UIScreen mainScreen] applicationFrame]
#endif

#ifndef kAppBounds
#define kAppBounds [[UIScreen mainScreen] bounds]
#endif

#ifndef kAppScale
#define kAppScale [[UIScreen mainScreen] scale]
#endif

#ifndef kDeviceWidthScaleToiPhone4
#define kDeviceWidthScaleToiPhone4 (kDeviceWidth/320.0)
#endif

#ifndef kDeviceHeightScaleToiPhone4
#define kDeviceHeightScaleToiPhone4 (kDeviceHeight/480.0)
#endif

#ifndef kDeviceWidthScaleToiPhone6
#define kDeviceWidthScaleToiPhone6 (kDeviceWidth/375.0)
#endif

#ifndef kDeviceHeightScaleToiPhone6
#define kDeviceHeightScaleToiPhone6 (kDeviceHeight/667.0)
#endif

#ifndef kRGB
#define kRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#endif

#ifndef kRGBA
#define kRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#endif

#define kHRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kHRGBA(rgbValue, alphaValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphaValue]

#define kWhiteColor kRGB(255.0, 255.0, 255.0)
#define kBlackColor kRGB(0, 0, 0)
#define kBlueColor  kRGB(0, 0, 255)
#define kRedColor   kRGB(255, 0, 0)
#define kGreenColor kRGB(0, 255, 0)
#define kGrayColor  kRGB(128, 128, 128)
#define kCyanColor  kRGB(0, 255, 255)
#define kYellowColor kRGB(255, 255, 0)
#define kPinkColor  kRGB(255, 0, 255)
#define kClearColor [UIColor clearColor]
#define kRandomColor (kRGB(arc4random()%255, arc4random()%255, arc4random()%255))
#define kRandomColorA(alpha) (kRGBA(arc4random()%255, arc4random()%255, arc4random()%255, alpha))

#ifndef kAppVersion
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#endif

#ifndef kAppBuild
#define kAppBuild [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#endif

#ifndef kAppName
#define kAppName [[[NSBundle mainBundle] localizedInfoDictionary] objectForKey:@"CFBundleDisplayName"]
#endif

#ifndef IOS6
#define IOS6 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0 && [[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)
#endif

#ifndef IOS7
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0
#endif

#ifndef IOS8
#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0
#endif

#ifndef IOS9
#define IOS9 [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0
#endif

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

// IOS Version
#ifndef iOSVersion
#define iOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])
#endif

#ifndef iOS6
#define iOS6 (iOSVersion >= 6.0 && iOSVersion < 7.0)
#endif

#ifndef iOS6_OR_LATER
#define iOS6_OR_LATER iOSVersion >= 6.0
#endif

#ifndef iOS7
#define iOS7 (iOSVersion >= 7.0 && iOSVersion < 8.0)
#endif

#ifndef iOS7_OR_LATER
#define iOS7_OR_LATER iOSVersion >= 7.0
#endif

#ifndef iOS8
#define iOS8 (iOSVersion >= 8.0 && iOSVersion < 9.0)
#endif

#ifndef iOS8_OR_LATER
#define iOS8_OR_LATER iOSVersion >= 8.0
#endif

#ifndef iOS9
#define iOS9 (iOSVersion >= 9.0 && iOSVersion < 10.0)
#endif

#ifndef iOS9_OR_LATER
#define iOS9_OR_LATER iOSVersion >= 9.0
#endif

#ifndef iOS10
#define iOS10 (iOSVersion >= 10.0 && iOSVersion < 11.0)
#endif

#ifndef iOS10_OR_LATER
#define iOS10_OR_LATER iOSVersion >= 10.0
#endif

#ifndef iOS11_OR_LATER
#define iOS11_OR_LATER iOSVersion >= 11.0
#endif

#define kStatusBarHeight CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)

// 判断是否是iPhone X
#define iPhoneXMode ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 状态栏高度
#define STATUS_BAR_HEIGHT (iPhoneXMode ? 44.f : 20.f)
// 导航栏高度
#define NAVIGATION_BAR_HEIGHT (iPhoneXMode ? 88.f : 64.f)
// tabBar高度
#define TAB_BAR_HEIGHT (iPhoneXMode ? (49.f+34.f) : 49.f)
// home indicator
#define HOME_INDICATOR_HEIGHT (iPhoneXMode ? 34.f : 0.f)

#define kApiCallbackReport @""

#define kStr(str) NSLocalizedString(str, nil)

#define kOnlyWifiDownloadImage @"onlyWifiDownloadImage"

#define kFont(fsize, name) [UIFont fontWithName:name size:fsize]
#define kAppFont(size) [UIFont systemFontOfSize:size]
#define kAppFontBold(size) [UIFont boldSystemFontOfSize:size]
#define kAppImageName(name) [UIImage imageNamed:name]

#define kOpenURL(url) [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]]
#define kCanOpenURL(url) [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]

#define canTel                 kCanOpenURL(@"tel:")
#define tel(phoneNumber)       kOpenURL(([NSString stringWithFormat:@"tel:%@",phoneNumber]))
#define telprompt(phoneNumber) kOpenURL(([NSString stringWithFormat:@"telprompt:%@",phoneNumber]))

#define kPerfectUserInfo(userId) [NSString stringWithFormat:@"kPerfectUserInfo-%d",userId]

#ifdef APP_DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#define DLogFrame(rect) DLog(@"x:%f, y: %f, w: %f, h: %f", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#else
#define DLog(...)
#define DLogFrame(rect)
#endif

#endif /* UtilsMacro_h */
