//
//  BFNetworkReachabilityManager.h
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/28.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, BFNetworkReachabilityStatus) {
    BFNetworkReachabilityStatusUnknown          = -1,
    BFNetworkReachabilityStatusNotReachable     = 0,
    BFNetworkReachabilityStatusReachableViaWWAN = 1,
    BFNetworkReachabilityStatusReachableViaWiFi = 2,
};

@interface BFNetworkReachabilityManager : NSObject

@property (nonatomic, assign, readonly, getter = isReachable) BOOL reachable;

@property (nonatomic, assign, readonly, getter = isReachableViaWWAN) BOOL reachableViaWWAN;

@property (nonatomic, assign, readonly, getter = isReachableViaWiFi) BOOL reachableViaWiFi;

+ (BFNetworkReachabilityManager *)sharedManager;

- (void)startReachabilityMonitor:(void(^)(BFNetworkReachabilityStatus status))callback;

@end
