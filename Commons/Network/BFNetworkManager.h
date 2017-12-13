//
//  CHBNetworkManager.h
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"

@class BFRequest,BFResponse;

@interface BFNetworkManager : NSObject

+ (BFNetworkManager *)sharedManager;

- (void)get:(NSString *)urlString
    success:(void (^)(id response))success
    failure:(void (^)(NSError *error))failure;

- (void)post:(NSString *)urlString
    progress:(void (^)(NSProgress *downloadProgress))progress
     success:(void (^)(id response))success
     failure:(void (^)(NSError *error))failure;

- (void)get:(NSString *)urlString
   progress:(void (^)(NSProgress *downloadProgress))progress
    success:(void (^)(id response))success
    failure:(void (^)(NSError *error))failure;

- (void) post:(NSString *)urlString
constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block
    onSuccess:(void (^)(id response)) success
    onFailure:(void (^)(NSError *error))failure;

- (void)post:(NSString *)urlString
  parameters:(id)parameters
     success:(void (^)(id response))success
     failure:(void (^)(NSError *error))failure;

- (void)APIGet:(BFRequest *)request forResponseClass:(Class)clazz
      progress:(void (^)(NSProgress *))progress
       success:(void (^)(BFResponse *response))success
       failure:(void (^)(NSError *error))failure;

- (void)APIPost:(BFRequest *)request forResponseClass:(Class)clazz
       progress:(void (^)(NSProgress *))progress
        success:(void (^)(BFResponse *response))success
        failure:(void (^)(NSError *error))failure;

- (void)APIPut:(BFRequest *)request forResponseClass:(Class)clazz
       success:(void (^)(BFResponse *response))success
       failure:(void (^)(NSError *error))failure;

- (void)APIDelete:(BFRequest *)request forResponseClass:(Class)clazz
          success:(void (^)(BFResponse *response))success
          failure:(void (^)(NSError *error))failure;

- (void)abort:(NSString *)url;

@end
