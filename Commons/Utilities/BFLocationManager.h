//
//  CHCLocationManager.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/3.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>
#import "BFLocation.h"

@interface BFLocationManager : NSObject

@property (nonatomic, assign) BOOL deferringUpdates;
@property (nonatomic, assign) CGFloat minSpeed;     //最小速度
@property (nonatomic, assign) CGFloat minFilter;    //最小范围
@property (nonatomic, assign) CGFloat minInteval;   //更新间隔

+ (BFLocationManager *) sharedManager;

- (void) reverseGeoLoc:(CLLocation *)loc onCompletion:(void(^)(BFLocation *location)) completion;

- (void) locateCityOnCompletion:(void(^)(BFLocation *location)) completion;

- (void) locateOnCompletion:(void(^)(CLLocation *location)) completion;

@end
