//
//  CHCVersion.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/21.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFVersion : NSObject

+ (BFVersion *) sharedVersion;

- (BOOL) isNewVersion:(NSString *) version;

@end
