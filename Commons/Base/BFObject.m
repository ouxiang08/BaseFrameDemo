//
//  CHBNetworkManager.m
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFObject.h"
#import "NSString+Utilities.h"

@interface BFObject (JSONModel)

- (NSDictionary *)jsonModelDictionary;

- (NSString *)jsonModelJson;

@end

@implementation BFObject

- (id) init {
    self = [super init];
    if (self) {
        _contentSize = CGSizeZero;
    }
    return self;
}

- (CGFloat) contentHeight{
    if(_contentHeight==0){
        [self calculateContentHeight];
    }
    return _contentHeight;
}

- (CGSize) contentSize {
    if (CGSizeEqualToSize(_contentSize, CGSizeZero)) {
        [self calculateContentHeight];
    }
    return _contentSize;
}

- (void) calculateContentHeight{
    
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    if (!dictionary) {
        return nil;
    }
    NSError *error;
    BFObject *object = [self initWithDictionary:dictionary error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    return object;
}

- (instancetype)initWithJSON:(NSString *)jsonString {
    if ([NSString isNullOrEmpty:jsonString]) {
        return nil;
    }
    NSError *error;
    BFObject *object = [self initWithString:jsonString error:&error];
    if (error) {
        NSLog(@"%@", error);
    }
    return object;
}

- (NSDictionary *)dictionary {
    return [self jsonModelDictionary];
}

- (NSString *)json {
    return [self jsonModelJson];
}

+ (Class)classForArray:(NSString *)propertyName {
    return nil;
}

+ (NSArray *)ignoredProperties {
    return nil;
}

@end

@implementation BFObject (JSONModel)

+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}

+ (BOOL)propertyIsIgnored:(NSString *)propertyName {
    NSArray *ignoredProperties = [self ignoredProperties];
    if (ignoredProperties && [ignoredProperties containsObject:propertyName]) {
        return YES;
    }
    return NO;
}

+ (NSString *)protocolForArrayProperty:(NSString *)propertyName {
    Class clazz = [self classForArray:propertyName];
    if (clazz) {
        return NSStringFromClass([clazz class]);
    }
    return nil;
}

- (NSDictionary *)jsonModelDictionary {
    return [super toDictionary];
}

- (NSString *)jsonModelJson {
    return [super toJSONString];
}

+ (NSDictionary *)convertKeyMapper {
    return nil;
}

+ (JSONKeyMapper *)keyMapper {
    if ([self convertKeyMapper]) {
        return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:[self convertKeyMapper]];
    }
    return nil;
}

@end
