//
//  CHBNetworkManager.m
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFNetworkManager.h"
#import "BFRequest.h"
#import "BFResponse.h"

@implementation BFNetworkManager {
    NSMutableDictionary *_url2Tasks;
    AFHTTPSessionManager *_sessionManager;
}

static BFNetworkManager *_sharedInstance = nil;

+ (BFNetworkManager *)sharedManager {
    @synchronized([BFNetworkManager class]) {
        if (!_sharedInstance) {
            _sharedInstance = [[self alloc] init];
        }
        if (_sharedInstance) {
            [_sharedInstance prepareNetworkManager];
        }
        return _sharedInstance;
    }
    return nil;
}

+ (id)alloc {
    @synchronized([BFNetworkManager class]) {
        NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedInstance = [super alloc];
        return _sharedInstance;
    }
    return nil;
}

- (void)prepareNetworkManager {
    if (!_sessionManager) {
//        _sessionManager = [[AFHTTPSessionManager manager] initWithBaseURL:[NSURL URLWithString:@"https://121.43.226.201:8443"]];
//        [_sessionManager setSecurityPolicy:[self securityPolicy]];
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    if (!_url2Tasks) {
        _url2Tasks = [NSMutableDictionary dictionary];
    }
}

- (void)get:(NSString *)urlString
    success:(void (^)(id response))success
    failure:(void (^)(NSError *error))failure {
    [self get:urlString progress:nil success:success failure:failure];
}

- (void)post:(NSString *)urlString
    progress:(void (^)(NSProgress *downloadProgress))progress
     success:(void (^)(id response))success
     failure:(void (^)(NSError *error))failure {
    [self post:urlString progress:progress success:success failure:failure];
}

- (void)post:(NSString *)apiName parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    [self post:apiName parameters:parameters progress:nil success:success failure:failure];
}

- (void)APIGet:(BFRequest *)request  forResponseClass:(Class)clazz progress:(void (^)(NSProgress *))progress success:(void (^)(BFResponse *response))success failure:(void (^)(NSError *error))failure {
    [self prepareHttpHeaders:request];
    
    __weak typeof(self) weakSelf = self;
    
    [_url2Tasks setObject:
     [_sessionManager GET:request.url parameters:request.parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (responseObject) {
                BFResponse *response = [[clazz alloc] initWithDictionary:@{@"data":responseObject}];
                if (response && request.enableResponseObject) {
                    [response setValue:responseObject forKey:@"responseObject"];
                }
                success(response);
            }
            else {
                NSAssert(responseObject == nil, @"responseObject is nill");
                NSLog(@"responseObject is %@",responseObject);
            }
            [weakSelf handleRequestSuccess:request.url];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [weakSelf handleRequestFailure:request.url];
    }] forKey:request.url];
}

- (void)APIPost:(BFRequest *)request forResponseClass:(Class)clazz progress:(void (^)(NSProgress *))progress success:(void (^)(BFResponse *response))success failure:(void (^)(NSError *error))failure {
    [self prepareHttpHeaders:request];
    
    __weak typeof(self) weakSelf = self;
    
    [_url2Tasks setObject:
     [_sessionManager POST:request.url parameters:request.parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (responseObject) {
                BFResponse *response = [[clazz alloc] initWithDictionary:@{@"data":responseObject}];
                if (response && request.enableResponseObject) {
                    [response setValue:responseObject forKey:@"responseObject"];
                }
                success(response);
            }
            else {
                NSAssert(responseObject == nil, @"responseObject is nill");
                NSLog(@"responseObject is %@",responseObject);
            }
            [weakSelf handleRequestFailure:request.url];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [weakSelf handleRequestFailure:request.url];
    }] forKey:request.url];
}

- (void)APIPut:(BFRequest *)request forResponseClass:(Class)clazz success:(void (^)(BFResponse *response))success failure:(void (^)(NSError *error))failure {
    [self prepareHttpHeaders:request];
    
    __weak typeof(self) weakSelf = self;
    
    [_url2Tasks setObject:
     [_sessionManager PUT:request.url parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (responseObject) {
                BFResponse *response = [[clazz alloc] initWithDictionary:@{@"data":responseObject}];
                if (response && request.enableResponseObject) {
                    [response setValue:responseObject forKey:@"responseObject"];
                }
                success(response);
            }
            else {
                NSAssert(responseObject == nil, @"responseObject is nill");
                NSLog(@"responseObject is %@",responseObject);
            }
            [weakSelf handleRequestFailure:request.url];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [weakSelf handleRequestFailure:request.url];
    }] forKey:request.url];
}

- (void)APIDelete:(BFRequest *)request forResponseClass:(Class)clazz success:(void (^)(BFResponse *response))success failure:(void (^)(NSError *error))failure {
    [self prepareHttpHeaders:request];
    
    __weak typeof(self) weakSelf = self;
    
    [_url2Tasks setObject:
     [_sessionManager DELETE:request.url parameters:request.parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            if (responseObject) {
                BFResponse *response = [[clazz alloc] initWithDictionary:@{@"data":responseObject}];
                if (response && request.enableResponseObject) {
                    [response setValue:responseObject forKey:@"responseObject"];
                }
                success(response);
            }
            else {
                NSAssert(responseObject == nil, @"responseObject is nill");
                NSLog(@"responseObject is %@",responseObject);
            }
            [weakSelf handleRequestFailure:request.url];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [weakSelf handleRequestFailure:request.url];
    }] forKey:request.url];
}

- (void)get:(NSString *)urlString progress:(void (^)(NSProgress *))progress success:(void (^)(id ))success failure:(void (^)(NSError *))failure {
    
    __weak typeof(self) weakSelf = self;
    
    [_url2Tasks setObject:
     [_sessionManager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
            [weakSelf handleRequestSuccess:urlString];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [weakSelf handleRequestFailure:urlString];
    }] forKey:urlString];
}

- (void)post:(NSString *)urlString parameters:(id)parameters progress:(void (^)(NSProgress *))progress success:(void (^)(id ))success failure:(void (^)(NSError *))failure {
    
    __weak typeof(self) weakSelf = self;
    [_url2Tasks setObject:
     [_sessionManager POST:urlString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
            [weakSelf handleRequestFailure:urlString];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [weakSelf handleRequestFailure:urlString];
    }] forKey:urlString];
}

- (void)post:(NSString *)urlString
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block
   onSuccess:(void (^)(id))success
   onFailure:(void (^)(NSError *))failure {
    __weak typeof(self) weakSelf = self;
    [_sessionManager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (block) {
            block(formData);
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
            [weakSelf handleRequestFailure:urlString];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [weakSelf handleRequestFailure:urlString];
    }];
}

- (void)handleRequestSuccess:(NSString *)urlString {
    [_url2Tasks removeObjectForKey:urlString];
}

- (void)handleRequestFailure:(NSString *)urlString {
    [_url2Tasks removeObjectForKey:urlString];
}

- (AFSecurityPolicy *)securityPolicy {
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"server" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = @[certData];
    return securityPolicy;
}

- (void)prepareHttpHeaders:(BFRequest *)request {
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
    
    [requestSerializer setTimeoutInterval:[request timeoutInterval]];
    
    NSDictionary *headers = [request headers];
    if (headers) {
        for (NSInteger i = 0, n = headers.allKeys.count; i < n; ++ i) {
            NSString *key = [headers.allKeys objectAtIndex:i];
            [requestSerializer setValue:[headers objectForKey:key] forHTTPHeaderField:key];
        }
    }
    
    if (request.acceptContentTypes) {
        [responseSerializer setAcceptableContentTypes:request.acceptContentTypes];
    }
    
    _sessionManager.requestSerializer = requestSerializer;
    _sessionManager.responseSerializer = responseSerializer;
}

- (void)abort:(NSString *)url {
    NSURLSessionDataTask *task = [_url2Tasks objectForKey:url];
    if (task) {
        [task cancel];
        [_url2Tasks removeObjectForKey:url];
    }
}

@end
