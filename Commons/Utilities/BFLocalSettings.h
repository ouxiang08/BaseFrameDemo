//
//  BFLocalSetting.h
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/7/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFLocalSettings : NSObject

+ (BFLocalSettings *)sharedSettings;

- (id) getSettings:(NSString *)key;

- (void) setSettings:(id)settings forKey:(NSString *)key;

- (void) removeSettingsForKey:(NSString *)key;

- (BOOL) hasSettingForKey:(NSString *)key;

@end
