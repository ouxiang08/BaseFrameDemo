//
//  CHBNetworkManager.h
//  CHBaseFrame
//
//  Created by Jimmy on 2017/6/27.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "JSONModel.h"

@interface BFObject : JSONModel
{
    CGFloat _contentHeight;
    CGSize _contentSize;
}

@property (nonatomic, assign) BOOL isExpand;

- (CGFloat)contentHeight;

- (CGSize)contentSize;

- (void)calculateContentHeight;

- (NSString *)json;

- (NSDictionary *)dictionary;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (instancetype)initWithJSON:(NSString *)jsonString;

+ (NSArray *)ignoredProperties;

+ (Class)classForArray:(NSString *)propertyName;

@end
