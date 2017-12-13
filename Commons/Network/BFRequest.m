//
//  BFRequest.m
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/28.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFRequest.h"

static NSTimeInterval REQUEST_TIMEOUT_INTERVAL = 30;

@implementation BFRequest {
    BOOL _showsLoadingView;
    BOOL _showsRetryView;
}

- (NSString *)url {
    return [NSString stringWithFormat:@"%@://%@:%@%@%@", [self scheme], [self host], [self port], [self path], [self api]];
}

- (NSString *)scheme {
    return @"http";
}

- (NSString *)host {
    return @"";
}

- (NSString *)port {
    return @"80";
}

- (NSString *)path {
    return @"";
}

- (NSString *)api {
    return @"";
}

- (void) setShowsLoadingView:(BOOL)showsLoadingView {
    _showsLoadingView = showsLoadingView;
}

- (BOOL) showsLoadingView {
    return _showsLoadingView;
}

- (void) setShowRetryView:(BOOL)showsRetryView {
    _showsRetryView = showsRetryView;
}

- (BOOL) showsRetryView {
    return _showsRetryView;
}

- (NSDictionary *)parameters {
    return self.dictionary;
}

- (NSDictionary *)headers {
    return @{
             @"Accept" : @"application/json",
             @"Content-Type" : @"application/json",
             @"Data-Type" : @"json",
             @"Accept-Encoding" : @"gzip",
             @"Content-Encoding" : @"gzip",
             };
}

- (NSSet *)acceptContentTypes {
    return [NSSet setWithObjects:@"application/json", @"text/html", @"text/plain", nil];
}

- (BOOL)enableResponseObject {
    return NO;
}

- (NSTimeInterval)timeoutInterval {
    return REQUEST_TIMEOUT_INTERVAL;
}

+ (NSArray *)ignoredProperties {
    return @[@"showsLoadingView", @"showsRetryView", @"loadingMessage", @"retryMessage"];
}

@end
