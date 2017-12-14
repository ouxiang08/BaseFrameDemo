//
//  TWDeviceUtilities.m
//  Mars
//
//  Created by chris on 6/19/14.
//  Copyright (c) 2014 lifang. All rights reserved.
//

#import "TWDeviceUtilities.h"
#import <sys/utsname.h>
#import  <CoreTelephony/CTCarrier.h>
#import  <CoreTelephony/CTTelephonyNetworkInfo.h>
#include <ifaddrs.h>
#include <arpa/inet.h>
#import <AdSupport/ASIdentifierManager.h>
#import "NSString+Utilities.h"

@implementation TWDeviceUtilities
static TWDeviceUtilities * _sharedInstance = nil;

+ (TWDeviceUtilities*) sharedInstance
{
    @synchronized([TWDeviceUtilities class])
	{
        if(!_sharedInstance)
            _sharedInstance = [[self alloc]init];
        return _sharedInstance;
    }
    return nil;
}

+ (id)alloc
{
    @synchronized([TWDeviceUtilities class])
	{
		NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		_sharedInstance = [super alloc];
		return _sharedInstance;
	}
	return nil;
}

- (NSString*) getDeviceUid{
    if(!_deviceUid){
        _deviceUid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    }
    return _deviceUid;
}


- (NSString*) getDeviceType{
    if(!_deviceType){
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *code = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
        
        if ([code rangeOfString:@"iPod"].location != NSNotFound){
            _deviceType = @"iPod touch";
        }
        
        else if ([code rangeOfString:@"iPad"].location != NSNotFound){
            _deviceType = @"iPad";
            if([code rangeOfString:@"iPad1,1"].location != NSNotFound ||
               [code rangeOfString:@"iPad2,1"].location != NSNotFound ||
               [code rangeOfString:@"iPad2,2"].location != NSNotFound ||
               [code rangeOfString:@"iPad2,3"].location != NSNotFound ||
               [code rangeOfString:@"iPad2,4"].location != NSNotFound){
                _deviceType = @"iPad1";
            }
            else if([code rangeOfString:@"iPad2,5"].location != NSNotFound ||
               [code rangeOfString:@"iPad2,6"].location != NSNotFound ||
               [code rangeOfString:@"iPad2,7"].location != NSNotFound){
                _deviceType = @"iPad Mini";
            }
            else if([code rangeOfString:@"iPad3,1"].location != NSNotFound ||
                    [code rangeOfString:@"iPad3,2"].location != NSNotFound ||
                    [code rangeOfString:@"iPad3,3"].location != NSNotFound){
                _deviceType = @"iPad3";
            }
            else if([code rangeOfString:@"iPad3,4"].location != NSNotFound ||
                    [code rangeOfString:@"iPad3,5"].location != NSNotFound ||
                    [code rangeOfString:@"iPad3,6"].location != NSNotFound){
                _deviceType = @"iPad4";
            }
            else if([code rangeOfString:@"iPad4,1"].location != NSNotFound ||
                    [code rangeOfString:@"iPad4,2"].location != NSNotFound){
                _deviceType = @"iPad Air";
            }
            else if([code rangeOfString:@"iPad4,4"].location != NSNotFound ||
                    [code rangeOfString:@"iPad4,5"].location != NSNotFound){
                _deviceType = @"iPad Mini Retia";
            }
        }
        else if ([code rangeOfString:@"iPhone"].location != NSNotFound){
            _deviceType = @"iPhone";
            if([code rangeOfString:@"iPhone3,1"].location != NSNotFound ||
               [code rangeOfString:@"iPhone3,3"].location != NSNotFound){
                _deviceType = @"iPhone4";
            }
            else if([code rangeOfString:@"iPhone4,1"].location != NSNotFound){
                _deviceType = @"iPhone4s";
            }
            else if([code rangeOfString:@"iPhone5,1"].location != NSNotFound ||
                    [code rangeOfString:@"iPhone5,2"].location != NSNotFound){
                _deviceType = @"iPhone5";
            }
            else if([code rangeOfString:@"iPhone5,3"].location != NSNotFound ||
                    [code rangeOfString:@"iPhone5,4"].location != NSNotFound){
                _deviceType = @"iPhone5C";
            }
            else if([code rangeOfString:@"iPhone6,1"].location != NSNotFound ||
                    [code rangeOfString:@"iPhone6,2"].location != NSNotFound){
                _deviceType = @"iPhone5S";
            }
            else if([code rangeOfString:@"iPhone7,2"].location != NSNotFound){
                _deviceType = @"iPhone6";
            }
            else if([code rangeOfString:@"iPhone7,1"].location != NSNotFound){
                _deviceType = @"iPhone6 Plus";
            }
            else if([code rangeOfString:@"iPhone8,1"].location != NSNotFound){
                _deviceType = @"iPhone6S";
            }
            else if([code rangeOfString:@"iPhone8,2"].location != NSNotFound){
                _deviceType = @"iPhone6S Plus";
            }
            else if([code rangeOfString:@"iPhone8,4"].location != NSNotFound){
                _deviceType = @"iPhoneSE";
            }
        }
        else if([code rangeOfString:@"i386"].location != NSNotFound){
            return @"Simulator i386";
        }
        else if([code rangeOfString:@"x86_64"].location != NSNotFound){
            return @"Simulator x86_64";
        }
    }
    return _deviceType;
}

- (NSString*) getDeviceName{
    return [SDiOSVersion deviceNameString];
}

- (NSString*) getModel{
    return [[UIDevice currentDevice] model];
}

- (NSString*) getIMEI{
    if(!_imei){
//        extern CFStringRef kLockdownIMEIKey;
//        void* connection = lockdown_connect();
//        _imei = [(NSString*)lockdown_copy_value(connection, NULL, kLockdownIMEIKey) autorelease];
//        lockdown_disconnect(connection);
        _imei = @"";
    }
    return _imei;
}

- (NSString*) getSystemVersion{
    if(!_systemVersion){
        _systemVersion = [[ UIDevice currentDevice ] systemVersion];
    }
    return _systemVersion;
}

- (NSString*) getSystemName{
    return [[UIDevice currentDevice] systemName];
}

- (NSInteger) getSystemMajorVersion{
    return [[self getSystemVersion] doubleValue];
}

- (NSString *)getIPAddress {
    NSString *address = @"error";
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    return address;
}

-(NSString*)getCellularProviderName
{
    if (!_cellularProviderName) {
        CTTelephonyNetworkInfo *netInfo = [[CTTelephonyNetworkInfo alloc]init];
        
        CTCarrier*carrier = [netInfo subscriberCellularProvider];
        if (carrier!=NULL) {
//            NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
//            [dic setObject:[carrier carrierName] forKey:@"Carriername"];
//            [dic setObject:[carrier mobileCountryCode] forKey:@"MobileCountryCode"];
//            [dic setObject:[carrier mobileNetworkCode]forKey:@"MobileNetworkCode"];
//            [dic setObject:[carrier isoCountryCode] forKey:@"ISOCountryCode"];
//            [dic setObject:[carrier allowsVOIP]?@"YES":@"NO" forKey:@"AllowsVOIP"];
            _cellularProviderName = [carrier carrierName];
        }
    }
    return [NSString isNullOrEmpty:_cellularProviderName]? @"" : _cellularProviderName;
    
}

- (BOOL) limitAdTracking {
    return [[ASIdentifierManager sharedManager] isAdvertisingTrackingEnabled];
}

- (NSString *)idfa
{
    //if(![self limitAdTracking])
    {
        NSUUID *IDFA = [[ASIdentifierManager sharedManager] advertisingIdentifier];
        
        return [IDFA UUIDString];
    }
    
    return nil;
}

- (BOOL) iPhonePlus {
    DeviceVersion deviceVersion = [SDiOSVersion deviceVersion];
    DeviceSize deviceSize = [SDiOSVersion deviceSize];
    if(deviceVersion==iPhone6Plus || deviceVersion==iPhone6SPlus || deviceVersion == iPhone7Plus || deviceSize==Screen5Dot5inch){
        return YES;
    }
    return NO;
}

- (BOOL) iPhone6 {
    DeviceVersion deviceVersion = [SDiOSVersion deviceVersion];
    DeviceSize deviceSize = [SDiOSVersion deviceSize];
    if(deviceVersion==iPhone6 || deviceVersion==iPhone6S || deviceVersion == iPhone7 || deviceSize==Screen4Dot7inch){
        return YES;
    }
    return NO;
}

- (BOOL) iPhone5 {
    DeviceVersion deviceVersion = [SDiOSVersion deviceVersion];
    DeviceSize deviceSize = [SDiOSVersion deviceSize];
    if(deviceVersion==iPhone5 || deviceVersion==iPhone5C || deviceVersion==iPhone5S || deviceVersion==iPodTouch5Gen || deviceVersion==iPodTouch6Gen || deviceVersion == iPhoneSE || deviceSize==Screen4inch){
        return YES;
    }
    return NO;
}

- (BOOL) iPhone4 {
    DeviceVersion deviceVersion = [SDiOSVersion deviceVersion];
    DeviceSize deviceSize = [SDiOSVersion deviceSize];
    if(deviceVersion==iPhone4 || deviceVersion==iPhone4S || deviceVersion==iPodTouch3Gen || deviceVersion==iPodTouch4Gen || deviceSize==Screen3Dot5inch){
        return YES;
    }
    return NO;
}

@end
