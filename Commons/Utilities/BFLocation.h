//
//  BFLocation.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/3.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFLocation : NSObject

@property (nonatomic, strong) NSString *country;

@property (nonatomic, strong) NSString *state;

@property (nonatomic, strong) NSString *city;

@property (nonatomic, strong) NSString *area;

@property (nonatomic, strong) NSString *address;

@property (nonatomic, assign) double latitude;

@property (nonatomic, assign) double longitude;

@end
