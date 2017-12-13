

//
//  BFReforerProtocol.h
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

@class CHCAPIManager;

@protocol BFReforerProtocol <NSObject>

- (NSDictionary *)reformDataWithManager:(CHCAPIManager *)manager;

- (NSArray *)reformArrayWithManager:(CHCAPIManager *)manager;

@end
