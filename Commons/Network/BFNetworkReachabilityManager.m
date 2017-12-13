//
//  BFNetworkReachabilityManager.m
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/28.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFNetworkReachabilityManager.h"
#import "AFNetworking/AFNetworking.h"

@implementation BFNetworkReachabilityManager

static BFNetworkReachabilityManager *_sharedInstance;

+ (BFNetworkReachabilityManager *)sharedManager {
    @synchronized([BFNetworkReachabilityManager class]) {
        if (!_sharedInstance) {
            _sharedInstance = [[self alloc] init];
        }
        return _sharedInstance;
    }
    return nil;
}

- (void)startReachabilityMonitor:(void (^)(BFNetworkReachabilityStatus))callback {
    __weak typeof(self) weakSelf = self;
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [weakSelf handleReachabilityStatusChange:status callback:callback];
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)handleReachabilityStatusChange:(AFNetworkReachabilityStatus)status callback:(void (^)(BFNetworkReachabilityStatus))callback {
    if (callback) {
        callback([self statusFromAFStatus:status]);
    }
}

- (BFNetworkReachabilityStatus)statusFromAFStatus:(AFNetworkReachabilityStatus)status {
    if (status == AFNetworkReachabilityStatusNotReachable) {
        return BFNetworkReachabilityStatusUnknown;
    }
    else if (status == AFNetworkReachabilityStatusNotReachable) {
        return BFNetworkReachabilityStatusNotReachable;
    }
    else if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
        return BFNetworkReachabilityStatusReachableViaWiFi;
    }
    else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
        return BFNetworkReachabilityStatusReachableViaWWAN;
    }
    return BFNetworkReachabilityStatusUnknown;
}

- (BOOL)isReachable {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

- (BOOL)isReachableViaWWAN {
    return [[AFNetworkReachabilityManager sharedManager] isReachableViaWWAN];
}

- (BOOL)isReachableViaWiFi {
    return [[AFNetworkReachabilityManager sharedManager] isReachableViaWiFi];
}

@end
