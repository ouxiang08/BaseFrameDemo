
//
//  VendorMacro.h
//  CHBaseFrame
//  第三方和组件相关的宏定义
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#ifndef VendorMacro_h
#define VendorMacro_h

///Third Party

static NSString *kWechatAppId = @"wx030dbc6b5f023c8d";
static NSString *kWechatAppSecret = @"e86d96aa15f600f36f52330e0d7a8a2d";
static NSString *kWeiBoAppId = @"2452231757";
static NSString *kTalklDataAppId = @"99313F76430F9AA911D08D4C2F914137";
static NSString *kAMapAppId = @"737824d885d315e4cb7e16927858ebc7";

//环迅支付参数
#define PAY_HX_MD5CERT @"CGTDzuTuvaBruLKG8PoCnykjqBRtKbFaaGdHZucrW3EQeBOrgSFM3dHTf8ZN1DxCeqmBAPMxwJj2VCn7TuUZUEef93qs2rWdhsr877RoVgrWhvVhlhy8yUgflBaDvQ3k" //按商户号来修改md5证书
#define PAY_HX_DESKEY @"UA3Gpl9FPWganoKNWm2UgzFp" //设置des加密的key
#define PAY_HX_DESIV  @"gxuoQ5kf" //设置des加密的向量
#define PAY_HX_MERCODE @"182906"
#define PAY_HX_ACCCODE @"1829060019"
#define PAY_HX_CCYCODE @"156"
#define PAY_HX_PRDCODE @"2301"

#ifdef APP_DEV
    #define kAppDefaultHostProtocal @"http"
    #define kAppDefaultHost @"172.16.0.179"
    #define kAppDefaultPath @""
    #define kAppDefaultHostPort @"80"
    #define JAVA_BASE_URL  @"http://172.16.0.179/"
#elif defined APP_TEST
    #define kAppDefaultHostProtocal @"http"
    #define kAppDefaultHost @"test.1jia2.cn"
    #define kAppDefaultPath @""
    #define kAppDefaultHostPort @"80"
    #define JAVA_BASE_URL  @"https://test.1jia2.cn/"
#else
    #define kAppDefaultHostProtocal @"http"
    #define kAppDefaultHost @"mp.1jia2.cn"
    #define kAppDefaultPath @""
    #define kAppDefaultHostPort @"80"
    #define JAVA_BASE_URL  @"https://mp.1jia2.cn/"
#endif

#define kDefaultApi(api) [NSString stringWithFormat:@"%@://%@:%@/%@%@", kAppDefaultHostProtocal, kAppDefaultHost, kAppDefaultHostPort, kAppDefaultPath, api]

static NSString *kLocalSettingsKeywordHistory = @"kLocalSettingsKeywordHistory";

typedef NS_ENUM(NSInteger,CHCSearchType) {
    CHCSearchMix = 0,
    CHCSearchStore = 1,
    CHCSearchGoods = 2
};

#endif /* VendorMacro_h */
