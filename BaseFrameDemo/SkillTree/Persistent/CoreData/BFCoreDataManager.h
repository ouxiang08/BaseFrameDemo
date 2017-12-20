//
//  BFCoreDataManager.h
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/20.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void(^CallbackBlock)(void);

static NSString *const kSchemeName = @"BaseFrameDemo";

@interface BFCoreDataManager : NSObject

@property (nonatomic, strong) NSPersistentContainer *persistentContainer;

- (id)initWithCompletionBlock:(CallbackBlock)callback;

@end
