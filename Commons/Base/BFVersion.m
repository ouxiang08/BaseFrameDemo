//
//  CHCVersion.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/21.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFVersion.h"
#import "NSString+Utilities.h"
#import "UtilsMacro.h"

@implementation BFVersion

static BFVersion* _sharedInstance = nil;

+ (BFVersion*) sharedVersion {
    @synchronized([BFVersion class])
    {
        if(!_sharedInstance)
            _sharedInstance = [[self alloc] init];
        return _sharedInstance;
    }
    return nil;
}

+ (id)alloc {
    @synchronized([BFVersion class])
    {
        NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedInstance = [super alloc];
        return _sharedInstance;
    }
    return nil;
}

- (BOOL) isNewVersion:(NSString *)version {
    if([NSString isNullOrEmpty:version]){
        return NO;
    }
    NSArray *versions = [version splitBy:@"."];
    if(!versions || versions.count==0){
        return NO;
    }
    NSArray *currentVerions = [kAppVersion splitBy:@"."];
    if(!currentVerions || currentVerions.count==0){
        return NO;
    }
    for(int i=0,n=(int)MIN(versions.count, currentVerions.count);i<n;i++){
        int v = [[currentVerions objectAtIndex:i] getIntValue];
        int v2 = [[versions objectAtIndex:i] getIntValue];
        if(v<v2){
            return YES;
        }
        if(v>v2) {
            return NO;
        }
    }
    if (versions.count>currentVerions.count) {
        for (NSInteger i=currentVerions.count; i<versions.count; i++) {
            int v = [[versions objectAtIndex:i] getIntValue];
            if (v>0) {
                return YES;
            }
        }
    }
    return NO;
}

@end
