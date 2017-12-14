//
//  BFLocalSetting.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/7/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFLocalSettings.h"
#import "NSString+Utilities.h"

@implementation BFLocalSettings

static BFLocalSettings* _sharedInstance = nil;

+ (BFLocalSettings*) sharedSettings {
    @synchronized([BFLocalSettings class]) {
        if(!_sharedInstance)
            _sharedInstance = [[self alloc]init];
        return _sharedInstance;
    }
    return nil;
}

+ (id)alloc {
    @synchronized([BFLocalSettings class]) {
        NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedInstance = [super alloc];
        return _sharedInstance;
    }
    return nil;
}

- (id)getSettings:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

- (void)setSettings:(id)settings forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:settings forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)removeSettingsForKey:(NSString *)key {
    if (![NSString isNullOrEmpty:key]){
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    }
}

- (BOOL)hasSettingForKey:(NSString *)key {
    return [self getSettings:key]? YES : NO;
}


@end
