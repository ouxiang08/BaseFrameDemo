//
//  BFRequest.h
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/28.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFObject.h"

@interface BFRequest : BFObject

@property (nonatomic, assign) BOOL showsLoadingView;

@property (nonatomic, strong) NSString *loadingMessage; // only used when showsLoadingView is set to YES

@property (nonatomic, assign) BOOL showsRetryView;

@property (nonatomic, strong) NSString *retryMessage; // only used when showsRetryView is set to YES

- (NSTimeInterval)timeoutInterval;

- (NSString *)url;

- (NSString *)scheme;               //网络请求协议，默认Http

- (NSString *)host;                 //请求主机名/域名

- (NSString *)port;                 //端口号,默认80

- (NSString *)path;

- (NSDictionary *)headers;          //Http的头部信息

- (NSDictionary *)parameters;       //网络请求的参数

- (NSSet *)acceptContentTypes;      //访问的内容类型

- (BOOL)enableResponseObject;

@end
