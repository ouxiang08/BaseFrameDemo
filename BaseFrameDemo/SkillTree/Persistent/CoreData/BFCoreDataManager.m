//
//  BFCoreDataManager.m
//  BaseFrameDemo
//
//  Created by Jimmy on 2017/12/20.
//  Copyright © 2017年 Jimmy. All rights reserved.
//

#import "BFCoreDataManager.h"

@interface BFCoreDataManager ()

//管理对象模型
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;

//持久化存储调度器
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//数据库名
@property (nonatomic, copy) NSString *storeName;

@end

@implementation BFCoreDataManager

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (!_persistentContainer) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:kSchemeName];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull storeDescription, NSError * _Nullable error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    return _persistentContainer;
}

- (id)initWithCompletionBlock:(CallbackBlock)callback {
    self = [super init];
    if (!self) {
        return nil;
    }
    NSURL *modelUrl = [[NSBundle mainBundle] URLForResource:kSchemeName withExtension:@"momd"];
    NSManagedObjectModel *mom = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelUrl];
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:mom];
    
    NSManagedObjectContext *moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [moc setPersistentStoreCoordinator:coordinator];
    //[self setManagedObjectContext:moc];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSURL *documentsURL = [[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        
        NSURL *storeURL = [documentsURL URLByAppendingPathComponent:@"DataModel.sqlite"];
        
        NSError *error = nil;
//        NSPersistentStoreCoordinator *psc = [[self managedObjectContext] persistentStoreCoordinator];
//        NSPersistentStore *store = [psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
//        NSAssert(store != nil, @"Error initializing PSC: %@\n%@", [error localizedDescription], [error userInfo]);
        
    });
}

#pragma mark - Getter



@end
