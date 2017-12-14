//
//  BFLocation.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/3.
//  Copyright © 2017年 hogan. All rights reserved.
//

#import "BFLocation.h"
#import "NSString+Utilities.h"

@implementation BFLocation

- (NSString*) country {
    return [NSString safeString:_country];
}

- (NSString*) state {
    return [NSString safeString:_state];
}

- (NSString*) city {
    return [NSString safeString:_city];
}

- (NSString*) area {
    return [NSString safeString:_area];
}

- (NSString*) address {
    return [NSString safeString:_address];
}


@end
