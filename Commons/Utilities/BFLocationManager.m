//
//  CHCLocationManager.m
//  com.chuanghe.ios.client
//
//  Created by Jimmy on 2017/8/3.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFLocationManager.h"
#import "NSString+Utilities.h"

@interface BFLocationManager (LocationDelegate) <CLLocationManagerDelegate>

@end

static BFLocationManager *_sharedInstance = nil;

@implementation BFLocationManager {
    BFLocation *_location;
    CLLocation *_cllocation;
    BOOL _locating;
    CLLocationManager *_locationManager;
    void(^_clcompletion)(CLLocation *location);
    void(^_completion)(BFLocation *location);
}

+ (BFLocationManager*) sharedManager {
    @synchronized([BFLocationManager class])
    {
        if(!_sharedInstance)
            _sharedInstance = [[self alloc] init];
        return _sharedInstance;
    }
    return nil;
}

+ (id)alloc {
    @synchronized([BFLocationManager class])
    {
        NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
        _sharedInstance = [super alloc];
        return _sharedInstance;
    }
    return nil;
}

- (void) locationServiceNotAvailable {
    NSLog(@"location service disabled.");
}

- (void) locateOnCompletion:(void (^)(CLLocation *location))completion {
    _clcompletion = completion;
    [self startLocationService];
}

- (void) locateCityOnCompletion:(void (^)(BFLocation *))completion {
    _completion = completion;
    [self startLocationService];
}

- (void) startLocationService {
    
    //if (![CLLocationManager locationServicesEnabled]&&[CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
    if(![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied) {
        [self locationServiceNotAvailable];
    } else {
        if (_locating) {
            return;
        }
        if (!_locationManager) {
            _locationManager = [[CLLocationManager alloc] init];
            _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
            //设置是否允许系统自动暂停定位，后台持续定位要设置为No
            _locationManager.pausesLocationUpdatesAutomatically = NO;
            _locationManager.distanceFilter = kCLDistanceFilterNone;
            if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                [_locationManager requestWhenInUseAuthorization];
            }
            if([_locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [_locationManager requestAlwaysAuthorization];
            }
            self.minSpeed = 3;
            self.minFilter = 50;
            self.minInteval = 10;
            _locationManager.distanceFilter  = self.minFilter;
        }
        //CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
        //NSLog(@"authorization status: %d", status);
        _locating = YES;
        _locationManager.delegate = self;
        _location = nil;
        [_locationManager startUpdatingLocation];
    }
}

- (void)reverseGeoLoc:(CLLocation *)loc onCompletion:(void (^)(BFLocation *locatioin))completion{
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:loc completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error)
        {
            NSLog(@"Failed with error: %@", error);
            if (completion) {
                completion(nil);
            }
            return;
        }
        if(placemarks.count > 0)
        {
            for (CLPlacemark *placemark in placemarks) {
                BFLocation *location = [[BFLocation alloc] init];
                location.latitude = loc.coordinate.latitude;
                location.longitude = loc.coordinate.longitude;
                
                if([placemark.addressDictionary objectForKey:@"FormattedAddressLines"] != NULL){
                    location.address = [[placemark.addressDictionary objectForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
                }
                if([placemark.addressDictionary objectForKey:@"SubAdministrativeArea"] != NULL){
                    location.area = [placemark.addressDictionary objectForKey:@"SubAdministrativeArea"];
                }
                if([placemark.addressDictionary objectForKey:@"City"] != NULL){
                    location.city = [placemark.addressDictionary objectForKey:@"City"];
                }
                if([placemark.addressDictionary objectForKey:@"State"]!=NULL){
                    location.state = [placemark.addressDictionary objectForKey:@"State"];
                }
                if([placemark.addressDictionary objectForKey:@"Country"] != NULL){
                    location.country = [placemark.addressDictionary objectForKey:@"Country"];
                }
                if (![NSString isNullOrEmpty:location.city] &&
//                    ![NSString isNullOrEmpty:location.state] &&
                    ![NSString isNullOrEmpty:location.country] &&
                    ![NSString isNullOrEmpty:location.address]) {
                    if (completion) {
                        completion(location);
                    }
                    break;
                }
            }
        }
    }];
}

- (void) locationDidUpdated:(CLLocation*) location {
    _cllocation = location;
    if (_clcompletion) {
        _clcompletion(location);
        _clcompletion = nil;
    }
}

- (void) handleReverseGeoInfo:(BFLocation *)location{
    
}

- (void)adjustDistanceFilter:(CLLocation *)location {
    NSLog(@"adjust:%f",location.speed);
    if ( location.speed < self.minSpeed ) {
        if ( fabs(_locationManager.distanceFilter - self.minFilter) > 0.1f ) {
            _locationManager.distanceFilter = self.minFilter;
        }
    }
    else {
        CGFloat lastSpeed = _locationManager.distanceFilter / self.minInteval;
        if ((fabs(lastSpeed - location.speed) / lastSpeed > 0.1f) || (lastSpeed < 0) ) {
            CGFloat newSpeed  = (int)(location.speed + 0.5f);
            CGFloat newFilter = newSpeed * self.minInteval;
            _locationManager.distanceFilter = newFilter;
        }
    }
}

- (void)uploadLocation:(CLLocation *)location {
    //[[CHCApplication sharedApplication] uploadLocationRequest:location];
    NSLog(@"location：%@",location);
}

@end

@implementation BFLocationManager (LocationDelegate)


- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    _locating = NO;

    if (locations && locations.count>0) {
        [_locationManager stopUpdatingLocation];
        //for (NSInteger i=locations.count-1;i>=0;--i)
        {
            CLLocation *loc = [locations objectAtIndex:0];
            if (loc) {
                [self adjustDistanceFilter:loc];
                [self uploadLocation:loc];
                
                BFLocation *location = [[BFLocation alloc] init];
                location.latitude = loc.coordinate.latitude;
                location.longitude = loc.coordinate.longitude;
                [self locationDidUpdated:loc];
            }else{
                [self locationDidUpdated:nil];
            }
            if (_completion) {
                [self reverseGeoLoc:loc onCompletion:_completion];
                _completion = nil;
            }
        }
    }
//    if (!self.deferringUpdates) {
//        CLLocationDistance distance = 500;
//        NSTimeInterval time = 10 * 60;
//        [_locationManager allowDeferredLocationUpdatesUntilTraveled:distance
//                                                           timeout:time];
//        self.deferringUpdates = YES;
//    }
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"############# location error: %@", error);
    _locating = NO;
    [self locationDidUpdated:nil];
}


@end
